import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repository/post/post_repo_local.dart';
import 'package:flutter_tech_task/data/repository/post/post_repository.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:flutter_tech_task/view/home/home_view_vm.dart';
import 'package:flutter_tech_task/view/post_offline/post_offline_vm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '../../../generated/view/post/view_models/post_save_vm.g.dart';

@riverpod
class PostSaveVM extends _$PostSaveVM {
  late PostRepositoryLocal _postRepository;

  @override
  Future<bool> build(int id) async {
    try {
      _postRepository = ref.read(postLocalRepositoryProvider);
      return await _postRepository.isPostSaved(id);
    } catch (e) {
      return false;
    }
  }

  Future<void> savePost(Post post) async {
    try {
      final result = await _postRepository.savePost(post);
      switch (result) {
        case Ok():
          state = AsyncData(true);
          ref.read(homeViewCountProvider.notifier).increment();
          ref.refresh(fetchOfflinePostsProvider);
        case Error():
          state = AsyncError(false, StackTrace.current);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> unSavePost(int id) async {
    try {
      final result = await _postRepository.unSavePost(id);
      switch (result) {
        case Ok():
                  state = AsyncData(false);

          ref.read(homeViewCountProvider.notifier).decrement();
          ref.refresh(fetchOfflinePostsProvider);

        case Error():
          state = AsyncError(false, StackTrace.current);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
