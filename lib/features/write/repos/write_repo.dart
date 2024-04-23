import 'package:http/http.dart' as http;
import 'dart:developer';


class WriteRepo{

static Future<bool> writeposts( String title , String body ,String userid) async{


    var client=http.Client();

    try{

       var response = await client.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
       body:{
        "userId":userid,
        "title":title,
        "body":body,

       });

      // if posting becomes successful returns true , else false
       
       if(response.statusCode >=200 && response.statusCode < 300){

        // var jsonresponse=jsonDecode(response.body);             //for getting id of written data
        // int?id = jsonresponse['id'];


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

