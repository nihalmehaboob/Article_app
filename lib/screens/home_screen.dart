import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_app_new/data/apis/posts_api.dart';
import 'package:sell_app_new/providers/posts_provider.dart';
import 'package:sell_app_new/screens/post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PostsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: (provider.isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(provider.posts[index].title),
                trailing: IconButton(
                    onPressed: () => provider.toggleLikePost(index),
                    icon: Icon(provider.posts[index].liked
                        ? Icons.favorite
                        : Icons.favorite_outline)),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PostScreen(
                          index: index,
                          post: provider.posts[index],
                        ))),
              ),
              itemCount: provider.posts.length,
            ),
    );
  }
}
