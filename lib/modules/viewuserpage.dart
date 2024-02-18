import 'package:blogapp_frontend/models/usermodel.dart';
import 'package:blogapp_frontend/services/userservices.dart';
import 'package:flutter/material.dart';

class ViewUserPage extends StatefulWidget {
  const ViewUserPage({super.key});

  @override
  State<ViewUserPage> createState() => _ViewUserPageState();
}

class _ViewUserPageState extends State<ViewUserPage> {
  Future<List<Users>> ?data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=UserApiService().getUsers();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData)
                {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                      itemBuilder: (value,index)
                      {
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                              child: Icon(Icons.person),
                                ),
                                title: Text(snapshot.data![index].userName),
                                subtitle: Text(snapshot.data![index].userPhone)
                              )
                            ],
                          ),
                        );
                      }
                  );
                }
              else
                {
                  return CircularProgressIndicator();
                }
            }
        ),
      ),
    );
  }
}
