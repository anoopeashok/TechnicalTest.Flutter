import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/utils/error_widgets.dart';
import 'package:flutter_tech_task/utils/progress_indicator.dart';
import 'package:flutter_tech_task/view/post/post_item.dart';
import 'package:flutter_tech_task/view/post_offline/post_offline_vm.dart';

class PostOfflineView extends ConsumerWidget {
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchOfflinePostsProvider);
    return state.when(
      data: (posts) => posts.isEmpty ? ErrorMessage(message: "No saved post",) : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostItem(post: posts[index]),
      ),
      error: (err, st) => ErrorMessage(message:"No saved post"),
      loading: () => const ProgressIndicatorWidget(),
    );
  }
}
