import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_app_new/data/models/post.dart';
import 'package:sell_app_new/providers/posts_provider.dart';

class PostScreen extends StatelessWidget {
  final int index;
  final Post post;
  const PostScreen({super.key, required this.index, required this.post});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PostsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        actions: [
          IconButton(
              onPressed: () => provider.toggleLikePost(index),
              icon: Icon(provider.posts[index].liked
                  ? Icons.favorite
                  : Icons.favorite_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(post.body),
      ),
    );
  }
}
