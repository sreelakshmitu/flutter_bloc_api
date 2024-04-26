import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_api/features/write/bloc/writeevent.dart';
import 'package:flutter_api/features/write/bloc/writestate.dart';
import 'package:flutter_api/features/write/repos/write_repo.dart';

class WriteBloc extends Bloc<WriteEvent,WriteState>{
  WriteBloc():super(WriteInitialState()){
    on<AddDataClickedEvent>(adddataclickedeevent);
    on<WriteInitialEvent>(writeinitialevent);
  }

  FutureOr<void> writeinitialevent(WriteInitialEvent event, Emitter<WriteState> emit) {
    emit(WriteInitialState());
  }
  FutureOr<void> adddataclickedeevent(AddDataClickedEvent event, Emitter<WriteState> emit) async{
     
     bool success=await WriteRepo.writeposts(event.title, event.body, event.userid);

    //  print(success);

     if(success){
       emit(AddDataSuccessState());
     }
     else{
       emit(AddDataErrorState());
     }
       
    
  }

  
}