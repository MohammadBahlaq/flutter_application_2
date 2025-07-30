import 'package:flutter_application_2/api/model/comment_model.dart';
import 'package:flutter_application_2/api/model/new_post_model.dart';
import 'package:flutter_application_2/api/model/post_model.dart';
import 'package:flutter_application_2/bloc/post_cubit/post_state_cubit.dart';
import 'package:flutter_application_2/core/api_service.dart';
import 'package:flutter_application_2/core/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostStateCubit> {
  PostCubit() : super(PostInitialCubit());

  Future<void> getPosts() async {
    emit(PostLoadingCubit());

    try {
      List data = await ApiService.get(Endpoints.posts);

      emit(
        PostSuccessCubit(
          posts: data.map((e) => PostModel.fromJson(e)).toList(),
        ),
      );
    } catch (e) {
      emit(PostFailCubit(errorMessage: e.toString()));
    }
  }

  Future<void> getComments(int postId) async {
    emit(PostLoadingCubit());

    try {
      List data = await ApiService.get(
        Endpoints.comments,
        parameters: {"postId": "$postId"},
      );

      emit(
        PostSuccessCubit(
          comments: data.map((e) => CommentModel.fromJson(e)).toList(),
        ),
      );
    } catch (e) {
      emit(PostFailCubit(errorMessage: e.toString()));
    }
  }

  Future<void> createPost(NewPostModel newPost) async {
    emit(PostLoadingCubit());

    try {
      Map<String, dynamic> map = await ApiService.post(
        Endpoints.posts,
        body: newPost.toJson(),
      );

      if (map.isEmpty) {
        throw "throw Error";
      }

      emit(PostSuccessCubit());
    } catch (e) {
      emit(PostFailCubit(errorMessage: e.toString()));
    }
  }
}
