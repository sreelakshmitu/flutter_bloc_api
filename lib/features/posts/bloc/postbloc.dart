import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_api/features/posts/models/post_data_model.dart';
import 'package:flutter_api/features/posts/repos/post_repo.dart';


part  'postevents.dart';
part  'poststate.dart';

class PostBloc extends Bloc<PostEvent,PostState>{
  PostBloc():super(PostInitialState()){
    on<PostInitialFetchEvent>(postinitialfetchevent);
  }

  FutureOr<void> postinitialfetchevent(PostInitialFetchEvent event, Emitter<PostState> emit) async{

    emit(PostInitialLoadingState());
    List<PostDataModel> posts = await PostRepo.fetchposts();

    emit(PostFetchSuccessfulState(post: posts));
    
     //

  }
}


