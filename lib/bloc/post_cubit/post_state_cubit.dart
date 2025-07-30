import 'package:flutter_application_2/api/model/comment_model.dart';
import 'package:flutter_application_2/api/model/post_model.dart';

abstract class PostStateCubit {}

class PostInitialCubit extends PostStateCubit {}

class PostLoadingCubit extends PostStateCubit {}

class PostSuccessCubit extends PostStateCubit {
  final List<PostModel> posts;
  final List<CommentModel> comments;

  PostSuccessCubit({this.posts = const [], this.comments = const []});
}

class PostFailCubit extends PostStateCubit {
  final String errorMessage;

  PostFailCubit({required this.errorMessage});
}
