import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repository/post/post_repo_local.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/view/post_offline/post_offline_vm.g.dart';

@riverpod
Future<List<Post>> fetchOfflinePosts(Ref ref) async{

  final postRepository = ref.read(postLocalRepositoryProvider);
  final result = await postRepository.fetchPosts();
  switch(result){
    case Ok():
    
      return result.value;
    case Error():
      return [];
  }
}