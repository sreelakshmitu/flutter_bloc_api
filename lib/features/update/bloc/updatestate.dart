abstract class UpdateState{}

abstract class UpdateActionState extends UpdateState{}

class UpdateInitialState extends UpdateState{}

class UpdateDataSuccessfulState extends UpdateState{}

class UpdateDataErrorState extends UpdateState{}