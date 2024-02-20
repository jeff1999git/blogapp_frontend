import 'package:blogapp_frontend/models/postmodel.dart';
import 'package:blogapp_frontend/services/postservice.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Future<List<Post>> ?data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=PostApiService().getPost();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot)
            {
              if(snapshot.hasData)
                {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                      itemBuilder: (value,index)
                      {
                        return Card(
                          child: Column(
                            children: [
                              Text(snapshot.data![index].post),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 35,
                                  child: Text(snapshot.data![index].userId.userName[0]),
                                ),
                                title: Text(snapshot.data![index].userId.userName),
                                subtitle: Text("Mobile :"+snapshot.data![index].userId.userPhone+"\n"
                                    +"Address :"+snapshot.data![index].userId.userEmail+"\n"+"Date :"
                                    +snapshot.data![index].postedDate.toIso8601String()),
                              ),

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
