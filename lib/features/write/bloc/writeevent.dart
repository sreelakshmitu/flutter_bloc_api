abstract class WriteEvent{}

class AddDataClickedEvent extends WriteEvent{

  
  final String id, userid;
  final String title,body;

  AddDataClickedEvent({required this.id, required this.userid, required this.title, required this.body});
  
}

class WriteInitialEvent extends WriteEvent{}

