abstract class UpdateEvent{}

class UpdateButtonClickedEvent extends UpdateEvent{

  final String id, userid , title ,body;

  UpdateButtonClickedEvent({required this.id, required this.userid, required this.title, required this.body});
  
}

class UpdateInitialEvent extends UpdateEvent{}