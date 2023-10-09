import 'package:flutter/material.dart';
import 'package:instagram_app/features/presentation/pages/Main/main_screen.dart';

void main() {
  runApp(const InstagramApp());
}

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram App ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}
