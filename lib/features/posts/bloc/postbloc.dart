import 'package:bloc/bloc.dart';

part  'postevents.dart';
part  'poststate.dart';

class PostBloc extends Bloc<PostEvent,PostState>{
  PostBloc():super(PostInitialState());
}


