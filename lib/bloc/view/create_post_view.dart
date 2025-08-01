import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/model/new_post_model.dart';
import 'package:flutter_application_2/bloc/post_cubit/post_cubit.dart';
import 'package:flutter_application_2/bloc/post_cubit/post_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_navigation/short_navigation.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  late TextEditingController titleContaoller;
  late TextEditingController bodyContaoller;

  @override
  void initState() {
    titleContaoller = TextEditingController();

    bodyContaoller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    titleContaoller.dispose();
    bodyContaoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postCrt = context.read<PostCubit>();

    return Scaffold(
      appBar: AppBar(title: Text("Create new post")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: titleContaoller,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: bodyContaoller,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          BlocBuilder<PostCubit, PostStateCubit>(
            buildWhen: (previous, current) {
              if (previous.runtimeType == current.runtimeType) {
                return false;
              }

              return true;
            },
            builder: (_, state) {
              if (state is PostLoadingCubit) {
                return CircularProgressIndicator.adaptive();
              }

              return ElevatedButton(
                child: Text("Create post"),
                onPressed: () {
                  postCrt.createPost(
                    NewPostModel(
                      title: titleContaoller.text,
                      body: bodyContaoller.text,
                      userId: "1",
                    ),
                  );
                },
              );
            },
          ),
          BlocListener<PostCubit, PostStateCubit>(
            listenWhen: (previous, current) {
              return true;
            },
            listener: (context, state) {},
            child: SizedBox(),
          ),
          BlocConsumer<PostCubit, PostStateCubit>(
            buildWhen: (previous, current) => true,
            listenWhen: (previous, current) => true,
            listener: (_, state) {
              if (state is PostLoadingCubit) {
                GoMessenger.dialog(AlertDialog(content: Text("Loading...")));
              }

              if (state is PostSuccessCubit) {
                Go.back();
                GoMessenger.dialog(AlertDialog(content: Text("Success")));
              }

              if (state is PostFailCubit) {
                Go.back();
                GoMessenger.dialog(
                  AlertDialog(content: Text(state.errorMessage)),
                );
              }
            },
            builder: (_, state) {
              if (state is PostFailCubit) {
                return Text(state.errorMessage);
              }
              if (state is PostSuccessCubit) {
                return Text("Success");
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
