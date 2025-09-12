

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/view/post/view_models/post_save_vm.dart';

class PostSaveButton extends ConsumerWidget{
  final Post post;
  PostSaveButton({required this.post, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postSaveVMProvider(post.id));
    final notifier = ref.read(postSaveVMProvider(post.id).notifier);

    return state.when(
      data: (isSaved) => isSaved ? IconButton(
        icon:  Icon(Icons.bookmark, color: Theme.of(context).colorScheme.primary,),
        onPressed: () {
          notifier.unSavePost(post.id);
        },
      ) : IconButton(
        icon: const Icon(Icons.bookmark_border),
        onPressed: () {
          notifier.savePost(post);
        }),
      loading: () => SizedBox.shrink(),
      error: (err, st) => SizedBox.shrink(),
    );
  }
  
}