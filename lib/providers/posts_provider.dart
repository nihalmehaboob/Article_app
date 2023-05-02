import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_app_new/data/apis/posts_api.dart';
import 'package:sell_app_new/data/models/post.dart';

class PostsProvider extends ChangeNotifier {
  List<Post> posts = [];
  bool isLoading = true;

  void loadPosts() async {
    posts = await PostsApi.getAllPosts();
    isLoading = false;
    print('loaded');
    notifyListeners();
  }

  void toggleLikePost(int index) async {
    posts[index] = posts[index].copyWith(liked: !posts[index].liked);
    print('called');
    notifyListeners();
  }
}
