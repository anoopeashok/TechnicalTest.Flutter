import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/utils/error_widgets.dart';
import 'package:flutter_tech_task/utils/progress_indicator.dart';
import 'package:flutter_tech_task/view/post/post_item.dart';
import 'package:flutter_tech_task/view/post/view_models/post_vm.dart';

class PostView extends ConsumerStatefulWidget {
  const PostView({super.key});

  @override
  ConsumerState<PostView> createState() => _PostViewState();
}

class _PostViewState extends ConsumerState<PostView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fetchPostsProvider);
    return state.when(
        data: (val) => ListView.builder(itemBuilder: (context, index) => PostItem(post: val[index],)
        , itemCount: val.length),
        error: (err, st) => ErrorMessage(message: err.toString()),
        loading: () => ProgressIndicatorWidget(),
      )
    ;
  }
}
