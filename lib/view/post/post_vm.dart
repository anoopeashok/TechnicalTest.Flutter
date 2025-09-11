
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repository/post/post_repo_remote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '../../generated/view/post/post_vm.g.dart';                                                                                               

@riverpod
Future<List<Post>> fetchPosts(Ref ref){
  final postRepository = ref.watch(postRemoteRepositoryProvider);
  return postRepository.fetchPosts();
}