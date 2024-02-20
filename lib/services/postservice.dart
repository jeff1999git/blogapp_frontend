import 'dart:convert';

import 'package:blogapp_frontend/models/postmodel.dart';
import 'package:http/http.dart'as http;

class PostApiService{
  Future<List<Post>> getPost() async
  {
    var client = http.Client();
    var apiUrl=Uri.parse("http://192.168.1.39:3001/api/post/viewpost");
    var response=await client.get(apiUrl);
    if(response.statusCode==200)
      {
        return postFromJson(response.body);
      }
    else
      {
        return [];
      }
  }

  Future<dynamic>  addPost(String userId,String post) async
  {
    var client = http.Client();
    var apiUrl=Uri.parse("http://192.168.1.39:3001/api/post/addpost");
    var response=await client.post(apiUrl,
      headers: <String,String>{
       "Content-Type" : "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>{
        "userId": userId,
        "post": post
      })
    );
    if(response.statusCode==200)
      {
        return json.decode(response.body);
      }
    else
      {
        throw Exception("Failed to Post");
      }
  }
}
