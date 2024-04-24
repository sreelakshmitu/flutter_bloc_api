abstract class HomeState{}

abstract class HomeActionState extends HomeState{}

class HomeInitialState extends HomeState{}

class HomeGetPostClickedState extends HomeActionState{}

class HomeWritePostClickedState extends HomeActionState{}

class HomeUpdatePostClickedState extends HomeActionState{}

class HomeDeletePostClickedState extends HomeActionState{}

class HomePatchPostClickedState extends HomeActionState{}