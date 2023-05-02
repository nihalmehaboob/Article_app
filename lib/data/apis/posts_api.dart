import 'dart:convert';

import 'package:sell_app_new/data/models/post.dart';
import 'package:http/http.dart' as http;

class PostsApi {
  PostsApi._();

  static const API_URL = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<Post>> getAllPosts() async {
    final response = await http.get(Uri.parse(API_URL));
    final data = response.body;
    final rawPosts = jsonDecode(data);
    List<Post> posts = [];
    rawPosts.forEach((post) => posts.add(Post.fromMap(post)));
    return posts;
  }
}
