import 'package:flutter/material.dart';
import 'package:flutter_api/features/posts/bloc/postbloc.dart';


class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    postbloc.add(PostInitialFetchEvent());
    super.initState();
  }
  final PostBloc postbloc=PostBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Posts')
      ),
    );
  }
}