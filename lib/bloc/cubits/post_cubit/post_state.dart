import 'package:flutter_application_2/api/model/comment_model.dart';
import 'package:flutter_application_2/api/model/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<PostModel> posts;
  final List<CommentModel> comments;

  PostSuccess({this.posts = const [], this.comments = const []});
}

class PostFail extends PostState {
  final String errorMessage;

  PostFail({required this.errorMessage});
}
