
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repository/post/post_repo_remote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/result.dart';
      part '../../../generated/view/post/view_models/post_vm.g.dart';
@riverpod
Future<List<Post>> fetchPosts(Ref ref) async{
  final postRepository = ref.watch(postRemoteRepositoryProvider);
  final result =  await postRepository.fetchPosts();
  switch(result){
    case Ok():
      return result.value;
    case Error():
      throw result.error;
  }
}