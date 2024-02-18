import 'package:blogapp_frontend/modules/homepage.dart';
import 'package:blogapp_frontend/services/userservices.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController name=new TextEditingController();
  final TextEditingController phone=new TextEditingController();
  final TextEditingController email=new TextEditingController();
  final TextEditingController pword=new TextEditingController();
  final TextEditingController cpword=new TextEditingController();
  @override
  void signUpUser() async
  {
    final response=await UserApiService().signUpData(name.text, phone.text, email.text, pword.text);
    if(pword.text==cpword.text)
      {
        if(response["status"]=="success")
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }
      }
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "User Name",
                  hintText: "Enter a valid username",
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                  controller: phone,
                decoration: InputDecoration(
                  labelText: "Phone No.",
                  hintText: "Enter your Phone No.",
                  border: OutlineInputBorder()
                ),
              ),
              TextField(controller: email,
                decoration: InputDecoration(
                  labelText: "Email ID",
                  hintText: "Enter yout email id",
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                controller: pword,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  hintText: "Enter a valid password",
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                controller: cpword,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Re-enter the password",
                  border: OutlineInputBorder()
                ),
              ),
              ElevatedButton(onPressed: signUpUser,
                  child: Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
