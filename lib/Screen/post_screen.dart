import 'package:beta_network_api_call/Screen/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:beta_network_api_call/Models/Post model.dart';
import 'package:beta_network_api_call/Service/http service.dart';
import 'package:http/http.dart';

class PostScreen extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Network Call"),
        ),

        body: FutureBuilder(
            future: httpService.getPost(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {

              if (snapshot.hasData) {
                List<Post> posts = snapshot.data;

                return ListView(
                  children: posts
                      .map(
                        (Post post) => ListTile(

                          title: Text(post.title),
                          subtitle: Text(post.id.toString()),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostDetail(
                                post
                              )
                            )

                          ),
                        ),
                      )
                      .toList(),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
