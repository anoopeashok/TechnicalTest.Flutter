import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/l10n/app_localizations.dart';
import 'package:flutter_tech_task/utils/error_widgets.dart';
import 'package:flutter_tech_task/view/comments/comments_view.dart';
import 'package:flutter_tech_task/view/post/post_save.dart';
import 'package:flutter_tech_task/view/post/view_models/post_detail_vm.dart';

class PostDetailView extends ConsumerWidget {
  final int postId;
  const PostDetailView({super.key,required this.postId});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final state = ref.watch(fetchPostByIdProvider(postId));
    return Scaffold(
      appBar: AppBar(title: const Text("Post Details"),
      actions: [
        state.when(
          data: (post) => PostSaveButton(post: post),
          error: (err, st) => SizedBox.shrink(),
          loading: () => SizedBox.shrink(),
        )
      ],
      ),
      
      
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
                      Text(post.body, style:  const TextStyle(fontSize: 16)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CommenstsListView(postId: post.id)));
                          }, child: Text(AppLocalizations.of(context)!.viewComments)),
                        ],
                      )
                    ])),
        error: (err, st) => ErrorMessage(message: err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );  
  }
}