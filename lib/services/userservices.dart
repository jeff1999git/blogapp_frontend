import 'dart:convert';

import 'package:blogapp_frontend/models/usermodel.dart';
import 'package:http/http.dart'as http;

class UserApiService{
  Future<dynamic> signInData(String email,String pword) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.1.39:3001/api/sign/signin");
    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type": "application/json; charset=UTF-8"
    },
      body: jsonEncode(<String,String>{
        "userEmail":email,
        "userPword":pword
      })
    );
    if(response.statusCode==200)
      {
        return json.decode(response.body);
      }
    else
      {
        throw Exception("Failed to login");
      }
  }

  Future<dynamic> signUpData(String name,String phone,String email,String pword) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.1.39:3001/api/sign/signup");
    var response= await client.post(apiUrl,
      headers: <String,String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>{
        "userName": name,
        "userPhone": phone,
        "userEmail": email,
        "userPword": pword
      })
    );
    if(response.statusCode==200)
      {
        return jsonDecode(response.body);
      }
    else
      {
        throw Exception("Failed to Sign Up");
      }
  }

  Future<List<Users>> getUsers() async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://192.168.1.39:3001/api/sign/viewusers");
    var response=await client.get(apiUrl);
    if(response.statusCode==200)
      {
        return usersFromJson(response.body);
      }
    else
      {
        return [];
      }
  }
}