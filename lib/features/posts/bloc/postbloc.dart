import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_api/features/posts/models/post_data_model.dart';
import 'package:http/http.dart' as http;

part  'postevents.dart';
part  'poststate.dart';

class PostBloc extends Bloc<PostEvent,PostState>{
  PostBloc():super(PostInitialState()){
    on<PostInitialFetchEvent>(postinitialfetchevent);
  }

  FutureOr<void> postinitialfetchevent(PostInitialFetchEvent event, Emitter<PostState> emit) async{
    
     var client= http.Client();
     List<PostDataModel> posts=[];

     try{
      var response =await client.get(
        Uri.https('https://jsonplaceholder.typicode.com/'));
        
        for(int i =0; i<response.body.length;i++){
          
          PostDataModel post=PostDataModel.fromMap(response.body[i] as Map<String, dynamic>);
          posts.add(post);
        }
     }
    catch(e){

      log(e.toString());
    }

  }
}


