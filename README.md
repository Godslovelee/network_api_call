# beta_network_api_call

A new Flutter application.

## Getting Started


## Initialization
```dart
Making use of http request library
for POST, GET and DELETE requests
import 'package:http/http.dart';
...
All classes offer a singleton instance that can be initiated by calling the `init(...)` methods and then accessed through `.instance`.
Regular instances can also be created using the constructor, which allows them to be managed by e.g. dependency injection instead.



## UI



```dart
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

```





This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
