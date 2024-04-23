import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_api/features/posts/repos/post_repo.dart';
import 'package:flutter_api/features/update/bloc/updateevent.dart';
import 'package:flutter_api/features/update/bloc/updatestate.dart';

class UpdateBloc extends Bloc<UpdateEvent,UpdateState>{
  UpdateBloc():super(UpdateInitialState()){
    on<UpdateButtonClickedEvent>(updatebuttonclickedevent);
    on<UpdateInitialEvent>(updateinitialevent);
  }

    FutureOr<void> updateinitialevent(UpdateInitialEvent event, Emitter<UpdateState> emit) {

      emit(UpdateInitialState());
  }

  FutureOr<void> updatebuttonclickedevent(UpdateButtonClickedEvent event, Emitter<UpdateState> emit) async{
    bool success= await PostRepo.updateposts(event.id,event.title,event.body,event.userid);

    print(success);

    if(success){
      emit(UpdateDataSuccessfulState());}

    else{
      emit(UpdateDataErrorState());
    }
    }
  

  }
