part of 'postbloc.dart';

abstract class PostState{}

class PostInitialState extends PostState{}

class PostInitialFetchState extends PostState{
  
  final List<PostDataModel> dartresponse;

  PostInitialFetchState({required this.dartresponse});
}