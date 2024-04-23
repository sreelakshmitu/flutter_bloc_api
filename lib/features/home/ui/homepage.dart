import 'package:flutter/material.dart';
import 'package:flutter_api/features/delete/ui/deletepage.dart';
import 'package:flutter_api/features/home/bloc/homebloc.dart';
import 'package:flutter_api/features/home/bloc/homeevent.dart';
import 'package:flutter_api/features/home/bloc/homestate.dart';
import 'package:flutter_api/features/posts/ui/postpage.dart';
import 'package:flutter_api/features/update/ui/updatepage.dart';
import 'package:flutter_api/features/write/ui/writepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    homebloc.add(HomeInitialEvent());
    super.initState();
  }
  final HomeBloc homebloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocConsumer<HomeBloc,HomeState>(
        bloc:homebloc,
        listener:(context,state){
          if(state is HomeGetPostClickedState){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> const PostPage()));
          }
          else if(state is HomeWritePostClickedState){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> const WritePage()));
          }
          else if(state is HomeUpdatePostClickedState){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const UpdatePage()));
          }
          else if(state is HomeDeletePostClickedState){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const DeletePage()));
          }
        },
        builder:(context,state){
          return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
               style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), 
              ),
              onPressed: (){homebloc.add(HomeGetPostClickedEvent());}, child: const Text('Get Posts',style:TextStyle(color: Colors.white))),
              const SizedBox(height:20),
              ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), 
              ),
                onPressed: (){homebloc.add(HomeWritePostClickedEvent());}, child: const Text('Write Post',style:TextStyle(color: Colors.white))),
              const SizedBox(height:20),
              ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), 
              ),
              onPressed: (){homebloc.add(HomeUpdatePostClickedEvent());}, child: const Text('Update Post',style:TextStyle(color: Colors.white))),
              const SizedBox(height:20),
              ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), 
              ),
                onPressed: (){homebloc.add(HomeDeletePostClickedEvent());}, child: const Text('Delete post',style:TextStyle(color: Colors.white))),
            ],
          ),
        );
        }
      )
     
    );
  }
}