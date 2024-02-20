import 'package:blogapp_frontend/modules/adduserpage.dart';
import 'package:blogapp_frontend/modules/postpage.dart';
import 'package:blogapp_frontend/modules/viewpost.dart';
import 'package:blogapp_frontend/modules/viewuserpage.dart';
import 'package:blogapp_frontend/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController username=new TextEditingController();
  final TextEditingController password=new TextEditingController();
  @override
  void checkCredentials() async
  {
    final response=await UserApiService().signInData(username.text, password.text);
    if(response["status"]=="success")
    {
      String userId=response["userdata"]["_id"].toString();
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefer=await SharedPreferences.getInstance();
      prefer.setString("userId", userId);
      print("Successful Login");
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>PostPage()
      ));
    }
    else if(response["status"]=="invalid email")
      {
        print("invalid email");
      }
    else if(response["status"]=="invalid password")
      {
        print("invalid password");
      }
    else
      {
        print("Invalid");
      }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "Enter your Username",
                border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(onPressed: checkCredentials,
                child: Text("Login")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUserPage()));
            },
                child: Text("New User")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUserPage()));
            },
                child: Text("View User")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage()));
            },
                child: Text("View Post")),
          ],
        ),
      ),
    );
  }
}
