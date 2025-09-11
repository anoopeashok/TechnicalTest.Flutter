import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/view/post/post_detail_vm.dart';

class PostDetailView extends ConsumerWidget {
  final int postId;
  const PostDetailView({super.key,required this.postId});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final state = ref.watch(fetchPostByIdProvider(postId));
    return Scaffold(
      appBar: AppBar(title: const Text("Post Details")),
      body: state.when(
        data: (post) => Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                        post.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(height: 10),
                      Text(post.body, style:  const TextStyle(fontSize: 16))
                    ])),
        error: (err, st) => ErrorWidget(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );  
  }
}