import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repository/post/post_repository.dart';
import 'package:flutter_tech_task/data/service/local_storage_service.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

      part '../../../generated/data/repository/post/post_repo_local.g.dart';                                                     

@riverpod
PostRepositoryLocal postLocalRepository(Ref ref)=> PostRepositoryLocal(
  localStorageService: ref.read(localStorageServiceProvider),
);


class PostRepositoryLocal extends PostRepository {
  final key = "posts";

  LocalStorageService _localStorageService;

  PostRepositoryLocal({required LocalStorageService localStorageService})
    : _localStorageService = localStorageService;

  @override
  Future<Result<List<Post>>> fetchPosts() async {
    final result = await _localStorageService.getList(key);
    switch (result) {
      case Ok():
        return Result.ok( List<Post>.from(result.value.map((e) => Post.fromJson(e))));
      case Error():
        return Result.error(NotFoundError());
    }
  }

  @override
  Future<Result<Post>> fetchPostById(int id) async {
    final result = await _localStorageService.getList(key);
    switch (result) {
      case Ok():
        try {
          return Result.ok(Post.fromJson(
            result.value.firstWhere((element) => element['id'] == id),
          ));
        } catch (e) {
          return Result.error(NotFoundError());
        }
      case Error():
        return Result.error(result.error);
    }
  }

  Future<Result<bool>> savePost(Post post) async {
    final cachedList = await _localStorageService.getList(key);
    switch (cachedList) {
      case Ok():
        List<dynamic> updatedList = List<dynamic>.from(cachedList.value);
        updatedList.add(post.toJson());
        final saveResult = await _localStorageService.createList(
          key,
          updatedList,
        );
        switch (saveResult) {
          case Ok():
            return Result.ok(true);
          case Error():
            return Result.error(saveResult.error);
        }
      case Error():
        final saveResult = await _localStorageService.createList(key, [
          post.toJson(),
        ]);
        switch (saveResult) {
          case Ok():
            return Result.ok(true);
          case Error():
            return Result.error(saveResult.error);
        }
    }
  }

  Future<Result<bool>> unSavePost(int id) async {
    final cachedList = await _localStorageService.getList(key);
    switch (cachedList) {
      case Ok():
        List<dynamic> updatedList = List<dynamic>.from(cachedList.value);
        updatedList.removeWhere((element) => element['id'] == id);
        final saveResult = await _localStorageService.createList(
          key,
          updatedList,
        );
        switch (saveResult) {
          case Ok():
            return Result.ok(true);
          case Error():
            return Result.error(saveResult.error);
        }
      case Error():
        return Result.error(cachedList.error);
    }
  }

  Future<bool> isPostSaved(int id) async {
    final cachedList = await _localStorageService.getList(key);
    switch (cachedList) {
      case Ok():
        bool isExists = false;
        List<dynamic> updatedList = List<dynamic>.from(cachedList.value);
        updatedList.forEach((element) {
          if (element['id'] == id) {
            isExists = true;
          }
        });
        return isExists;

      case Error():
        return false;
    }
  }
}
