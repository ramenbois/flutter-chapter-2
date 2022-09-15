import 'package:flutter/material.dart';

import 'post.dart';
import 'post_card.dart';
import 'services.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dio Fetch jsonplaceholder'),
        ),
        body: FutureBuilder<List<Post?>>(
          future: Services.fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post?> posts = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  children: posts
                      .map((postData) => PostCard(post: postData!))
                      .toList(),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
