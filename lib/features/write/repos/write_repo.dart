import 'package:http/http.dart' as http;
import 'dart:developer';


class WriteRepo{

static Future<bool> writeposts(String id , String title , String body ,String userid) async{


    var client=http.Client();

    try{

       var response = await client.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
       body:{
        "id":id,
        "userId":userid,
        "title":title,
        "body":body,

       });

      // if posting becomes successful returns true , else false
       
       if(response.statusCode >=200 && response.statusCode < 300){
        return true;
       } else{
        return false;
       }

        
        }
      catch(e){

      log(e.toString());
      return false;

  }

}
}