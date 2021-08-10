import 'package:beta_network_api_call/Service/http%20service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'post_screen.dart';
import 'package:beta_network_api_call/Models/Post model.dart';

class PostDetail extends StatelessWidget{

  final postscreen_title = PostScreen();

  final Post post;
final HttpService httpService = HttpService();


  PostDetail(@required this.post);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () async {

          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text("Title"),
                subtitle: Text("${post.title}"),
              ),

              ListTile(
                title: Text("iD"),
                subtitle: Text("${post.id}"),


                ),
              ListTile(
                title: Text("Body") ,
                subtitle: Text("The Body"),
              ),

              ListTile(
                title: Text("User Id"),
                subtitle: Text("${post.Userid}"),
              )
            ],
          ),
        ),
      ),
    );
  }

}