part of 'postbloc.dart';

abstract class PostState{}

abstract class PostActionState extends PostState{}

class PostInitialState extends PostState{}

// class PostInitialFetchState extends PostState{
  
//   final List<PostDataModel> dartresponse;

//   PostInitialFetchState({required this.dartresponse});
// }

class PostInitialLoadingState extends PostState{}

class PostFetchSuccessfulState extends PostState{

  final List<PostDataModel> post;

  PostFetchSuccessfulState({required this.post});
}