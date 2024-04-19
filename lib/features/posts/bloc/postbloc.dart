import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

part  'postevents.dart';
part  'poststate.dart';

class PostBloc extends Bloc<PostEvent,PostState>{
  PostBloc():super(PostInitialState()){
    on<PostInitialFetchEvent>(postinitialfetchevent);
  }

  FutureOr<void> postinitialfetchevent(PostInitialFetchEvent event, Emitter<PostState> emit) async{
    
     var client= http.Client();

     try{
      var response =await client.get(
        Uri.https('https://jsonplaceholder.typicode.com/'),

      );
     }
    catch(e){

      log(e.toString());
    }

  }
}


