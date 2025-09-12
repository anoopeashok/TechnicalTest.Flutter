import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/l10n/app_localizations.dart';
import 'package:flutter_tech_task/view/home/home_view_vm.dart';
import 'package:flutter_tech_task/view/post/post_view.dart';
import 'package:flutter_tech_task/view/post_offline/post_offline_view.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewCountProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.home),
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)!.posts),
              state.when(
                data: (count) => count > 0 ? Badge(
                  label: Text('$count'),
                  child: savedText(context) ): savedText(context),
                error: (err, st) => savedText(context),
                loading: () =>savedText(context))
              
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PostView(),
            PostOfflineView()
          ],
        ),
      ),
    );
  }

  Widget savedText(context){
    return Tab(text: AppLocalizations.of(context)!.savedPosts);
  }
}
