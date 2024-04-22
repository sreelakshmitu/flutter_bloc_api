import 'dart:async';
import 'dart:convert';
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

        List result=jsonDecode(response.body);
        
        for(int i =0; i<result.length;i++){
          
          PostDataModel post=PostDataModel.fromMap(result[i] as Map<String, dynamic>);
          posts.add(post);
        }
      emit(PostFetchSuccessfulState(post: posts));

     
     }
    catch(e){

      log(e.toString());
    }

  }
}


