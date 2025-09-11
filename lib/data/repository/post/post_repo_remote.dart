
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/data/repository/post/post_repository.dart';
import 'package:flutter_tech_task/data/service/api_service.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '../../../generated/data/repository/post/post_repo_remote.g.dart';                                                                        

@riverpod
PostRepository postRemoteRepository(Ref ref) => PostRepositoryRemote(apiService: ref.read(apiServiceProvider));


class PostRepositoryRemote implements PostRepository{

  ApiService _apiService;

  PostRepositoryRemote({required ApiService apiService}): _apiService = apiService;

  @override
  Future<List<Post>> fetchPosts() async{
    final endpoint = '/posts';
    final result = await _apiService.get(endpoint: endpoint);
    switch(result){
      case Ok():
        return List<Post>.from(result.value.map((e) => Post.fromJson(e)));
      case Error():
        throw Result.error(result.error);
    }
  }
  
  @override
  Future<Post> fetchPostById(int id) {
    final endpoint = '/posts/$id';
    return _apiService.get(endpoint: endpoint).then((result) {
      switch (result) {
        case Ok():
          return Post.fromJson(result.value);
        case Error():
          throw Result.error(result.error);
      }
    });
  }
}