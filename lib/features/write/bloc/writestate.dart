abstract class WriteState{}

abstract class WriteActionState extends WriteState{}

class WriteInitialState extends WriteState{}

class AddDataSuccessState extends WriteActionState{}

class AddDataErrorState extends WriteState{}