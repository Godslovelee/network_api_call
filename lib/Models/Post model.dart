import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
class Post {
   final int Userid;
  final int id;
  final String title;
  final String body;

  Post({ @required this.Userid, @required this.id, @required this.title, @required this.body});

  factory Post.fromJson(Map <String, dynamic> json){
    return Post(
        Userid : json["userId"] as int ,
        id : json["id"] as int,
        title : json ["title"] as String ,
        body : json ["body"] as String
    );
  }
}

