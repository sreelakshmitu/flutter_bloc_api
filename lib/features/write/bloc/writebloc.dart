import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_api/features/posts/repos/post_repo.dart';
import 'package:flutter_api/features/write/bloc/writeevent.dart';
import 'package:flutter_api/features/write/bloc/writestate.dart';

class WriteBloc extends Bloc<WriteEvent,WriteState>{
  WriteBloc():super(WriteInitialState()){
    on<AddDataClickedEvent>(adddataclickedeevent);
    on<WriteInitialEvent>(writeinitialevent);
  }

  FutureOr<void> writeinitialevent(WriteInitialEvent event, Emitter<WriteState> emit) {
    emit(WriteInitialState());
  }
  FutureOr<void> adddataclickedeevent(AddDataClickedEvent event, Emitter<WriteState> emit) async{
     
     bool success=await PostRepo.writeposts(event.id, event.title, event.body, event.userid);

     if(success){
       emit(AddDataSuccessState());
     }
     else{
       emit(AddDataErrorState());
     }
       
    
  }

  
}