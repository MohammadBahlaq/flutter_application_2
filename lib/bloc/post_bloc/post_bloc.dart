import 'package:flutter_application_2/api/model/comment_model.dart';
import 'package:flutter_application_2/core/api_service.dart';
import 'package:flutter_application_2/core/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostStateBloc> {
  PostBloc() : super(PostInitialBloc()) {
    on<PostEvent>((event, emit) async {
      if (event is GetComments) {
        getComments(event.postId, emit);
      }

      if (event is CreateComments) {
        //Crate
      }
    });
  }

  Future<void> getComments(int postId, Emitter<PostStateBloc> emit) async {
    emit(PostLoadingBloc());

    try {
      List data = await ApiService.get(
        Endpoints.comments,
        parameters: {"postId": "$postId"},
      );

      emit(
        PostSuccessBloc(
          comments: data.map((e) => CommentModel.fromJson(e)).toList(),
        ),
      );
    } catch (e) {
      emit(PostFailBloc(errorMessage: e.toString()));
    }
  }
}
