

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/data/repository/comments/comment_remote_repo.dart';
import 'package:flutter_tech_task/utils/error_widgets.dart';
import 'package:flutter_tech_task/utils/progress_indicator.dart';
import 'package:flutter_tech_task/view/comments/comments_vm.dart';

class CommenstsListView extends ConsumerWidget{
  int postId;
  CommenstsListView({super.key, required this.postId});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchCommentsForPostProvider(postId));
   return Scaffold(
    appBar: AppBar(
      title: Text('Comments'),

    ),
    body: state.when(
      data: (val) => ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => ListTile(
        title: Text(val[index].name),
        subtitle: Text(val[index].body),
        ),
        itemCount: val.length,
      ),
      error: (err, st) => ErrorMessage(message: err.toString()),
      loading: () => ProgressIndicatorWidget(),
    ) ,
   );
  }
  
}