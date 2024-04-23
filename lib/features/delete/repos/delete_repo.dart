import 'dart:developer';
import 'package:http/http.dart' as http;


class DeleteRepo{
static Future<bool> deleteposts(String id) async{

  var client=http.Client();
  
  try{
        
        var response=await client.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));

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