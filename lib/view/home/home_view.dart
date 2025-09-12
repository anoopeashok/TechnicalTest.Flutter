import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          title: Text('Home'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Posts"),
              state.when(
                data: (count) => count > 0 ? Badge(
                  label: Text('$count'),
                  child: Tab(text: "Saved")) : Tab(text: "Saved"),
                error: (err, st) => Tab(text: "Saved"),
                loading: () =>Tab(text: "Saved"))
              
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
}
