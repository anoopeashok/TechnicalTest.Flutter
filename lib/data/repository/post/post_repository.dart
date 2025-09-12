import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/utils/result.dart';

abstract class PostRepository {
  Future<Result<List<Post>>> fetchPosts();
  Future<Result<Post>> fetchPostById(int id);

}



