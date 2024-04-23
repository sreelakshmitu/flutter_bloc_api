import 'package:flutter/material.dart';
import 'package:flutter_api/features/posts/bloc/postbloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:const Text('Posts Page',style: TextStyle(color:Colors.white),)
      ),
      body:BlocConsumer<PostBloc,PostState>(
        bloc:postbloc,
        listenWhen:(previous,current)=>current is PostActionState,
        buildWhen:(previous,current)=> current is! PostActionState,
        listener: (context,state){},
        builder: (context,state){
          switch(state.runtimeType){
            case PostInitialLoadingState:
            return const Center(
              child:CircularProgressIndicator(),
            );
            case PostFetchSuccessfulState:
            final fetchsucces=state as PostFetchSuccessfulState;
            return  Scaffold(
                body: ListView.builder(
                  itemCount: fetchsucces.post.length,
                  itemBuilder: (context,index){
                    return Container(
                      color:Colors.grey.shade200,
                      padding: const EdgeInsets.all(16),
                      margin:const EdgeInsets.all(16),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(fetchsucces.post[index].title),
                          Text(fetchsucces.post[index].body),

                        ],
                      )
                    );
                  }),
            );
           default:
           return const SizedBox();

          }

        }, 
        
        )
    );
  }
}