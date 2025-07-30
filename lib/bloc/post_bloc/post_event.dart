part of 'post_bloc.dart';

sealed class PostEvent {}

class GetPosts extends PostEvent {}

class GetComments extends PostEvent {
  final int postId;

  GetComments({required this.postId});
}

class CreateComments extends PostEvent {}
