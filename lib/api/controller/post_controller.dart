import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/model/comment_model.dart';
import 'package:flutter_application_2/api/model/new_post_model.dart';
import 'package:flutter_application_2/api/model/post_model.dart';
import 'package:flutter_application_2/core/api_service.dart';
import 'package:flutter_application_2/core/endpoints.dart';

class PostController with ChangeNotifier {
  List<PostModel> posts = [];
  ApiStatus postsStatus = ApiStatus.initial;

  List<CommentModel> comments = [];
  ApiStatus commentsStatus = ApiStatus.initial;

  ApiStatus createPostStatus = ApiStatus.initial;

  File file = File("/storage/emulated/0/Download/test_file.json");

  Future<void> getPosts() async {
    postsStatus = ApiStatus.loading;
    notifyListeners();

    try {
      List data = await ApiService.get(Endpoints.posts);

      posts = data.map((e) => PostModel.fromJson(e)).toList();

      postsStatus = ApiStatus.success;
    } catch (e) {
      postsStatus = ApiStatus.fail;
    }

    notifyListeners();
  }

  Future<void> getComments(int postId) async {
    commentsStatus = ApiStatus.loading;
    notifyListeners();

    try {
      List data = await ApiService.get(
        Endpoints.comments,
        parameters: {"postId": "$postId"},
      );
      comments = data.map((e) => CommentModel.fromJson(e)).toList();

      commentsStatus = ApiStatus.success;
    } catch (e) {
      commentsStatus = ApiStatus.fail;
    }

    notifyListeners();
  }

  Future<void> createPost(
    NewPostModel newPost,
    Function() onSuccess,
    Function(String error) onFail,
  ) async {
    createPostStatus = ApiStatus.loading;
    notifyListeners();

    try {
      Map<String, dynamic> map = await ApiService.post(
        Endpoints.posts,
        body: newPost.toJson(),
      );

      await file.writeAsString("==============");
      await file.writeAsString(jsonEncode(newPost.toJson()));

      if (map.isEmpty) {
        throw "throw Error";
      }

      onSuccess();

      createPostStatus = ApiStatus.success;
    } catch (e) {
      createPostStatus = ApiStatus.fail;
      onFail(e.toString());
    }

    notifyListeners();
  }
}
