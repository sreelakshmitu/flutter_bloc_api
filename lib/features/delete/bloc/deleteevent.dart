abstract class DeleteEvent{}

class DeleteInitialEvent extends DeleteEvent{}

class DeleteButtonClickedEvent extends DeleteEvent{

  final String id;

  DeleteButtonClickedEvent({required this.id});
}