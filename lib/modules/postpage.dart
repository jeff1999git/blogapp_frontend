import 'package:blogapp_frontend/services/postservice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController post=new TextEditingController();
  @override
  void sendPost() async
  {
    SharedPreferences prefered=await SharedPreferences.getInstance();
    String userId=prefered.getString("userId")?? "";
    final response=await PostApiService().addPost(userId, post.text);
    if(response["status"]=="success")
      {
        print("successfully posted");
      }
    else
      {
        print("Failed to post");
      }
  }
  // void addPost() async
  // {
  //   // SharedPreferences prefer=await SharedPreferences.getInstance();
  //   // String userId=prefer.getString("userId")?? "";
  //   final response=await PostApiService().addPost(userId, post.text);
  //   if(response["status"]=="success")
  //     {
  //       print("Successfully Posted");
  //     }
  //   else
  //     {
  //       print("Error");
  //     }
  // }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Column(
              children: [
                TextField(
                  controller: post,
                  decoration: InputDecoration(
                    labelText: "Post Something",
                    hintText: "Write what's in your mind",
                    border: OutlineInputBorder()
                  ),
                ),
                ElevatedButton(onPressed: sendPost, child: Text("Add Post")),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Log Out"))
              ],
            ),
          ),
        ),
      );
  }
}
