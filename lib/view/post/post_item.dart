

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/data/models/post_model.dart';
import 'package:flutter_tech_task/view/post/post_details.dart';

class PostItem extends StatelessWidget {
  final Post post;
  PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailView(postId: post.id))),
      child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(post.body),
                    Container(height: 10),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
    );
  }
} 