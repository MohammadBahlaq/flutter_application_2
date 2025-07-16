import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/controller/post_controller.dart';
import 'package:flutter_application_2/api/model/new_post_model.dart';
import 'package:flutter_application_2/core/endpoints.dart';
import 'package:provider/provider.dart';
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
    final postCrt = context.read<PostController>();

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
          Selector<PostController, ApiStatus>(
            selector: (p0, p1) => p1.createPostStatus,
            builder: (context, createPostStatus, child) {
              if (createPostStatus == ApiStatus.loading) {
                return CircularProgressIndicator.adaptive();
              }

              return ElevatedButton(
                child: Text("Create post"),
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(content: Text("Loading...")),
                  );

                  postCrt.createPost(
                    NewPostModel(
                      title: titleContaoller.text,
                      body: bodyContaoller.text,
                      userId: "1",
                    ),
                    () {
                      Go.back();
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(content: Text("Success")),
                      );
                    },
                    (error) {
                      Go.back();
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) => AlertDialog(content: Text(error)),
                      );
                    },
                  );
                },
              );
            },
          ),

          Selector<PostController, ApiStatus>(
            selector: (p0, p1) => p1.createPostStatus,
            builder: (context, createPostStatus, child) {
              if (createPostStatus == ApiStatus.fail) {
                return Text("Error");
              }

              if (createPostStatus == ApiStatus.success) {
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
