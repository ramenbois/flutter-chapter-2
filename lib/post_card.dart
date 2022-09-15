import 'package:flutter/material.dart';

import 'post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          post.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          post.body,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
