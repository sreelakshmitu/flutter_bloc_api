abstract class PatchEvent{}


class PatchInitialEvent extends PatchEvent{}

class DropdownItemSelectedEvent extends PatchEvent{
  final String selectedvalue;

  DropdownItemSelectedEvent({required this.selectedvalue});

}


class PatchButtonClickedEvent extends PatchEvent{
  final String chosenvalue , value  ,id;

  PatchButtonClickedEvent({required this.chosenvalue, required this.value , required this.id});
}