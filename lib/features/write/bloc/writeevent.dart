abstract class WriteEvent{}

class AddDataClickedEvent extends WriteEvent{

  
  final String  userid;
  final String title,body;

  AddDataClickedEvent({required this.userid, required this.title, required this.body});
  
}

class WriteInitialEvent extends WriteEvent{}

