import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_app_new/providers/posts_provider.dart';
import 'package:sell_app_new/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostsProvider()..loadPosts())
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
