

import 'package:flutter_tech_task/data/models/comment_model.dart';
import 'package:flutter_tech_task/data/repository/comments/comment_remote_repo.dart';
import 'package:flutter_tech_task/data/repository/comments/comments_local_repository.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
      part '../../generated/view/comments/comments_vm.g.dart';

@riverpod
Future<List<CommentModel> > fetchCommentsForPost(Ref ref,int postId) async {
  
  final commentRepository = ref.read(commentRemoteRepositoryProvider);
  final commentLocalRepository = ref.read(commentsLocalRepositoryProvider);
  final result = await commentLocalRepository.fetchCommentsForPost(postId);
  switch (result) {
    case Ok():
      return result.value;
    case Error():
      final remoteResult = await commentRepository.fetchCommentsForPost(postId);
      switch (remoteResult) {
        case Ok():
          return remoteResult.value;
        case Error():
          throw remoteResult.error;
      }
  }
}