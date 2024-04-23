abstract class DeleteState{}

abstract class DeleteActionState extends DeleteState{}

class DeleteInitialState extends DeleteState{}

class DeleteDataSuccessfulState extends DeleteState{}

class DeleteDataErrorState extends DeleteState{}