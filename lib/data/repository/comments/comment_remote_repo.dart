

import 'package:flutter_tech_task/data/models/comment_model.dart';
import 'package:flutter_tech_task/data/service/api_service.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
      part '../../../generated/data/repository/comments/comment_remote_repo.g.dart';

@riverpod
CommentRemoteRepository commentRemoteRepository(Ref ref)=> CommentRemoteRepository(apiService: ref.read(apiServiceProvider));

class CommentRemoteRepository {

  ApiService _apiService;

  CommentRemoteRepository({required ApiService apiService}): _apiService = apiService;

  Future<Result<List<CommentModel>>> fetchCommentsForPost(int postId) async{
    final endpoint = '/posts/$postId/comments';
    final result = await _apiService.get(endpoint: endpoint);
    switch(result){
      case Ok():
        return Result.ok(List<CommentModel>.from(result.value.map((e) => CommentModel.fromJson(e))));
      case Error():
        return Result.error(result.error);
    }
  }
}