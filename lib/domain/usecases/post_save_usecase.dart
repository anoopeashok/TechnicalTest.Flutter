import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repository/comments/comment_remote_repo.dart';
import 'package:flutter_tech_task/data/repository/comments/comments_local_repository.dart';
import 'package:flutter_tech_task/data/repository/post/post_repo_local.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/domain/usecases/post_save_usecase.g.dart';

@riverpod
PostSaveUsecase postSaveUsecase(Ref ref) => PostSaveUsecase(
      postRepository: ref.read(postLocalRepositoryProvider),
      commentsLocalRepository: ref.read(commentsLocalRepositoryProvider),
      commentRemoteRepository: ref.read(commentRemoteRepositoryProvider),
    );


class PostSaveUsecase {
  final PostRepositoryLocal _postRepository;
  final CommentsLocalRepository _commentsLocalRepository;
  final CommentRemoteRepository _commentRemoteRepository;

  PostSaveUsecase({
    required PostRepositoryLocal postRepository,
    required CommentsLocalRepository commentsLocalRepository,
    required CommentRemoteRepository commentRemoteRepository,
  })  : _postRepository = postRepository,
        _commentsLocalRepository = commentsLocalRepository,
        _commentRemoteRepository = commentRemoteRepository;

  Future<Result<void>> savePostAndComments(Post post) async {
    try {
      final postResult = await _postRepository.savePost(post);
      switch (postResult) {
        case Error():
          return Result.error(postResult.error);
        case Ok():
      }

      final commentsResult = await _commentRemoteRepository
          .fetchCommentsForPost(post.id);
      switch (commentsResult) {
        case Error():
          return Result.error(commentsResult.error);
        case Ok():
      }
      final saveCommentsResult = await _commentsLocalRepository
          .saveCommentsForPost(post.id, commentsResult.value);
      switch (saveCommentsResult) {
        case Ok():
          return Result.ok(null);
        case Error():
          return Result.error(saveCommentsResult.error);
      }
    } catch (e) {
      return Result.error(UnKnownError());
    }
  }

  Future<Result<void>> unSavePostAndComments(int postId) async {
    try {
      final postResult = await _postRepository.unSavePost(postId);
      switch (postResult) {
        case Error():
          return Result.error(postResult.error);
        case Ok():
      }
      final commentsResult = await _commentsLocalRepository
          .deleteCommentsForPost(postId);
      switch (commentsResult) {
        case Ok():
          return Result.ok(null);
        case Error():
          return Result.error(commentsResult.error);
      }
    } catch (e) {
      return Result.error(UnKnownError());
    }
  }
}
