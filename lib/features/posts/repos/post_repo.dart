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
}