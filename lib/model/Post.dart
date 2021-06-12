import 'dart:convert';
import 'package:date_field/date_field.dart';

Post postJson(String str) =>
    Post.fromJson(json.decode(str));

String PostToJson(Post data) => json.encode(data.toJson());

class Post {
  int id;
  String category;
  String postInfo;


  Post({required this.id, required this.category, required this.postInfo});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      category: json["category"], postInfo: json["postInfo"], id: json["id"]);

  Map<String, dynamic> toJson() => {
    "category": category,
    "postInfo": postInfo,
    'id': id,
  };

  String get category1 => category;

  String get postInfo1 => postInfo;
}