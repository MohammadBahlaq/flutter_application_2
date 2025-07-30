part of 'post_bloc.dart';

sealed class PostStateBloc {}

final class PostInitialBloc extends PostStateBloc {}

final class PostLoadingBloc extends PostStateBloc {}

final class PostFailBloc extends PostStateBloc {
  final String errorMessage;

  PostFailBloc({required this.errorMessage});
}

final class PostSuccessBloc extends PostStateBloc {
  final List<CommentModel> comments;

  PostSuccessBloc({this.comments = const []});
}
