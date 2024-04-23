import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_api/features/posts/models/post_data_model.dart';

class PostRepo{ //what it returns
  static Future<List<PostDataModel>> fetchposts() async{

     List<PostDataModel> posts=[];

     try{
       var response = await http.get(Uri.https('jsonplaceholder.typicode.com', '/posts'));

        List result=jsonDecode(response.body);
        
        for(int i =0; i<result.length;i++){
          
          PostDataModel post=PostDataModel.fromMap(result[i] as Map<String, dynamic>);
          posts.add(post);
        }
     
      return posts;
     
     }
    catch(e){

      log(e.toString());
      return[];
    }
  }

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

static Future<bool> updateposts(String id , String title , String body ,String userid) async{


    var client=http.Client();

    try{

       var response = await client.put(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
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