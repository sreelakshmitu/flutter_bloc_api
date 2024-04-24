abstract class PatchState{}



class PatchInitialState extends PatchState{}

class PatchDataSelectedState extends PatchState{
  final String selectedvalue;

  PatchDataSelectedState({required this.selectedvalue});

}

class PatchDataAddedSuccesfulState extends PatchState{}

class PatchDataErrorState extends PatchState{}



