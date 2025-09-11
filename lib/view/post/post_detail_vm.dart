import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repository/post/post_repo_remote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '../../generated/view/post/post_detail_vm.g.dart';

@riverpod
Future<Post> fetchPostById(Ref ref, int id) {
  final postRepository = ref.watch(postRemoteRepositoryProvider);
  return postRepository.fetchPostById(id);
}
