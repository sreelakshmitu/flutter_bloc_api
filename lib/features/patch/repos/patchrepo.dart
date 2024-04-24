import 'dart:developer';
import 'package:http/http.dart' as http;


class PatchRepo{
static Future<bool> patchposts(String chosenvalue , String value , String id) async{

  var client=http.Client();
  
  try{
        
        var uri=Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');

        Map<String,dynamic> body={};
        if(chosenvalue=='userid'){
          body={'userId':value};

        }
        else if(chosenvalue=='title'){
          body={'title':value};
        }
        else if(chosenvalue=='body'){
          body={'body':value};
        }
        
        var response=await client.patch(uri,body: body);

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