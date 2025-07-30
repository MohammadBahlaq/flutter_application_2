import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/cubits/post_cubit/post_cubit.dart';
import 'package:flutter_application_2/bloc/cubits/post_cubit/post_state.dart';
import 'package:flutter_application_2/bloc/view/create_post_view.dart';
import 'package:flutter_application_2/bloc/view/show_comments_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_navigation/short_navigation.dart';

class ShowPostsView extends StatelessWidget {
  const ShowPostsView({super.key});

  @override
  Widget build(BuildContext _) {
    return BlocProvider(
      create: (_) => PostCubit()..getPosts(),
      child: Builder(
        builder: (context) {
          final postCrt = context.read<PostCubit>();
          // final postCrt = context.watch<PostCubit>();
          // final postCrt = BlocProvider.of<PostCubit>(context,listen: false);
          // final postCrt = BlocProvider.of<PostCubit>(context,listen: true);

          return Scaffold(
            appBar: AppBar(title: Text("Posts")),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Go.to(
                  BlocProvider.value(value: postCrt, child: CreatePostView()),
                );
              },
            ),
            body: BlocBuilder<PostCubit, PostState>(
              builder: (_, state) {
                if (state is PostLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is PostFail) {
                  return Center(child: Text("Error"));
                }

                if (state is PostSuccess) {
                  return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          postCrt.getComments(state.posts[index].id);

                          Go.to(
                            BlocProvider.value(
                              value: postCrt,
                              child: ShowComments(),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(state.posts[index].body),
                          ),
                        ),
                      );
                    },
                  );
                }

                return SizedBox();
              },
            ),
          );
        },
      ),
    );
  }
}
