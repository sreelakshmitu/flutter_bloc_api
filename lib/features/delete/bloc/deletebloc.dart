import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_api/features/delete/bloc/deleteevent.dart';
import 'package:flutter_api/features/delete/bloc/deletestate.dart';
import 'package:flutter_api/features/delete/repos/delete_repo.dart';


class DeleteBloc extends Bloc<DeleteEvent,DeleteState>{
  DeleteBloc():super(DeleteInitialState()){
    
    on<DeleteInitialEvent>(deleteinitialevent);

    on<DeleteButtonClickedEvent>(deletebuttonclickedevent);
  }

   FutureOr<void> deleteinitialevent(DeleteInitialEvent event, Emitter<DeleteState> emit) {

    emit(DeleteInitialState());
  }
  

  FutureOr<void> deletebuttonclickedevent(DeleteButtonClickedEvent event, Emitter<DeleteState> emit) async{

    bool success=await DeleteRepo.deleteposts(event.id);

    // print(success);

    if(success){

      emit(DeleteDataSuccessfulState());}

    else{

      emit(DeleteDataErrorState());
    }



  }

 
}