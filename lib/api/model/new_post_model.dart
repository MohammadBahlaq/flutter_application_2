// To parse this JSON data, do
//
//     final newPostModel = newPostModelFromJson(jsonString);

import 'dart:convert';

NewPostModel newPostModelFromJson(String str) =>
    NewPostModel.fromJson(json.decode(str));

String newPostModelToJson(NewPostModel data) => json.encode(data.toJson());

class NewPostModel {
  final String title;
  final String body;
  final String userId;

  NewPostModel({required this.title, required this.body, required this.userId});

  factory NewPostModel.fromJson(Map<String, dynamic> json) => NewPostModel(
    title: json["title"],
    body: json["body"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "userId": userId,
  };
}
