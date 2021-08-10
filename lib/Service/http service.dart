import 'dart:convert';

import 'package:beta_network_api_call/Models/Post%20model.dart';
import 'package:http/http.dart';

class HttpService {
  //final HttpService httpService = HttpService();
  final String posturl = "https://jsonplaceholder.typicode.com/posts";





  Future<List<Post>> getPost() async {
    Response response = await get(Uri.parse(posturl));

    if (response.statusCode == 200) {
      //var okay = List();

      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts =
          body.map((dynamic item_list) => Post.fromJson(item_list)).toList();
      return posts;
    } else {
      throw "cant get post";
    }
  }
}
