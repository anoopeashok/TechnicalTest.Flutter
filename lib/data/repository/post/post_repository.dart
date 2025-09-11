import 'package:flutter_tech_task/data/models/post_model.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
  Future<Post> fetchPostById(int id);

}



