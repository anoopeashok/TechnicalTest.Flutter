import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repository/post/post_repo_local.dart';
import 'package:flutter_tech_task/data/repository/post/post_repo_remote.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '../../../generated/view/post/view_models/post_detail_vm.g.dart';

@riverpod
Future<Post> fetchPostById(Ref ref, int id) async {
  final postRepository = ref.watch(postRemoteRepositoryProvider);
  final postLocalRepository = ref.watch(postLocalRepositoryProvider);
  final result = await postLocalRepository.fetchPostById(id);
  switch (result) {
    case Ok():
      return result.value;
    case Error():
      final remoteResult = await postRepository.fetchPostById(id);
      switch (remoteResult) {
        case Ok():
          return remoteResult.value;
        case Error():
          throw remoteResult.error;
      }
  }
}
