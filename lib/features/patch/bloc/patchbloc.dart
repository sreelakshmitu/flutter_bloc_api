import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_api/features/patch/bloc/patchevents.dart';
import 'package:flutter_api/features/patch/bloc/patchstate.dart';
import 'package:flutter_api/features/patch/repos/patchrepo.dart';



class PatchBloc extends Bloc<PatchEvent,PatchState>{

  String?chosenvalue;
  
  PatchBloc():super(PatchInitialState()){

  

  on<DropdownItemSelectedEvent>(dropdownitemselectedevent);

  on<PatchButtonClickedEvent>(patchbuttonclickedevent);

  on<PatchInitialEvent>(patchinitialevent);
  
  }

  FutureOr<void> patchinitialevent(PatchInitialEvent event, Emitter<PatchState> emit) {

    emit(PatchInitialState());
  }

 

  FutureOr<void> dropdownitemselectedevent(DropdownItemSelectedEvent event, Emitter<PatchState> emit) {
    
     emit(PatchDataSelectedState(selectedvalue: event.selectedvalue));
  }

  FutureOr<void> patchbuttonclickedevent(PatchButtonClickedEvent event, Emitter<PatchState> emit) async{

    final success=await PatchRepo.patchposts(event.chosenvalue, event.value, event.id);

    if(success){
      emit(PatchDataAddedSuccesfulState());}

    else{
      emit(PatchDataErrorState());
    }
   }
    
  
  
  }
