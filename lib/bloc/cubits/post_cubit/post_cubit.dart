import 'package:flutter_application_2/api/model/comment_model.dart';
import 'package:flutter_application_2/api/model/new_post_model.dart';
import 'package:flutter_application_2/api/model/post_model.dart';
import 'package:flutter_application_2/bloc/cubits/post_cubit/post_state.dart';
import 'package:flutter_application_2/core/api_service.dart';
import 'package:flutter_application_2/core/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  Future<void> getPosts() async {
    emit(PostLoading());

    try {
      List data = await ApiService.get(Endpoints.posts);

      emit(PostSuccess(posts: data.map((e) => PostModel.fromJson(e)).toList()));
    } catch (e) {
      emit(PostFail(errorMessage: e.toString()));
    }
  }

  Future<void> getComments(int postId) async {
    emit(PostLoading());

    try {
      List data = await ApiService.get(
        Endpoints.comments,
        parameters: {"postId": "$postId"},
      );

      emit(
        PostSuccess(
          comments: data.map((e) => CommentModel.fromJson(e)).toList(),
        ),
      );
    } catch (e) {
      emit(PostFail(errorMessage: e.toString()));
    }
  }

  Future<void> createPost(NewPostModel newPost) async {
    emit(PostLoading());

    try {
      Map<String, dynamic> map = await ApiService.post(
        Endpoints.posts,
        body: newPost.toJson(),
      );

      if (map.isNotEmpty) {
        throw "throw Error";
      }

      emit(PostSuccess());
    } catch (e) {
      emit(PostFail(errorMessage: e.toString()));
    }
  }
}
