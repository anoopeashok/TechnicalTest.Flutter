import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/view/post/post_item.dart';
import 'package:flutter_tech_task/view/post/post_vm.dart';

class PostView extends ConsumerStatefulWidget {
  const PostView({super.key});

  @override
  ConsumerState<PostView> createState() => _PostViewState();
}

class _PostViewState extends ConsumerState<PostView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fetchPostsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Post List")),
      body: state.when(
        data: (val) => ListView.builder(itemBuilder: (context, index) => PostItem(post: val[index],)
        , itemCount: val.length),
        error: (err, st) => ErrorWidget(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
