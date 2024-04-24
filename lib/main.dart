import 'package:flutter/material.dart';
import 'package:flutter_api/features/home/ui/homepage.dart';
// import 'package:flutter_api/features/posts/ui/postpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc with API',
      home: MyHomePage(),
    );
  }
}

