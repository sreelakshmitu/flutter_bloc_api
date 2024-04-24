import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_api/features/home/bloc/homeevent.dart';
import 'package:flutter_api/features/home/bloc/homestate.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(HomeInitialState()){

    on<HomeInitialEvent>(homeinitialevent);
    
    on<HomeGetPostClickedEvent>(getpostclickedevent);
    
    on<HomeWritePostClickedEvent>(writepostclickedevent);

    on<HomeUpdatePostClickedEvent>(updatepostclickedevent);

    on<HomeDeletePostClickedEvent>(deletepostclickedevent);

    on<HomePatchPostClickedEvent>(homepatchpostclickedevent);


  }

  FutureOr<void> homeinitialevent(HomeInitialEvent event, Emitter<HomeState> emit) {
    
    emit(HomeInitialState());
  }

  FutureOr<void> getpostclickedevent(HomeGetPostClickedEvent event, Emitter<HomeState> emit) {
    
    emit(HomeGetPostClickedState());
  }

  FutureOr<void> writepostclickedevent(event, Emitter<HomeState> emit) {
    emit(HomeWritePostClickedState());
  }

  FutureOr<void> updatepostclickedevent(HomeUpdatePostClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeUpdatePostClickedState());
  }

  FutureOr<void> deletepostclickedevent(HomeDeletePostClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeDeletePostClickedState());
  }



  FutureOr<void> homepatchpostclickedevent(HomePatchPostClickedEvent event, Emitter<HomeState> emit) {
    emit(HomePatchPostClickedState());
  }
}