import 'package:flutter_tech_task/data/models/comment_model.dart';
import 'package:flutter_tech_task/data/service/local_storage_service.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../generated/data/repository/comments/comments_local_repository.g.dart';

@riverpod
CommentsLocalRepository commentsLocalRepository(Ref ref) =>
    CommentsLocalRepository(
      localStorageService: ref.read(localStorageServiceProvider),
    );

class CommentsLocalRepository {
  LocalStorageService _localStorageService;
  CommentsLocalRepository({required LocalStorageService localStorageService})
    : _localStorageService = localStorageService;

  Future<Result<List<CommentModel>>> fetchCommentsForPost(int postId) async {
    try {
      final comments = await _localStorageService.getList(postId.toString());
      switch (comments) {
        case Ok():
          return Result.ok(
            List<CommentModel>.from(
              comments.value.map((e) => CommentModel.fromJson(e)),
            ),
          );
        case Error():
          return Result.error(comments.error);
      }
    } catch (e) {
      return Result.error(UnKnownError());
    }
  }

  Future<Result<void>> saveCommentsForPost(
    int postId,
    List<CommentModel> comments,
  ) async {
    try {
      final result = await _localStorageService.createList(
        postId.toString(),
        comments.map((e) => e.toJson()).toList(),
      );
      switch (result) {
        case Ok():
          return Result.ok(result.value);
        case Error():
          return Result.error(result.error);
      }
    } catch (e) {
      return Result.error(UnKnownError());
    }
  }

  Future<Result<void>> deleteCommentsForPost(
    int postId
  ) async {
    try {
      final result = await _localStorageService.delete(postId.toString());
      switch (result) {
        case Ok():
          return Result.ok(result.value);
        case Error():
          return Result.error(result.error);
      }
    } catch (e) {
      return Result.error(UnKnownError());
    }
  }
}
