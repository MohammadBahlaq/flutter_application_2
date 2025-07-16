import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/controller/post_controller.dart';
import 'package:flutter_application_2/core/endpoints.dart';
import 'package:provider/provider.dart';

class ShowComments extends StatelessWidget {
  const ShowComments({super.key});

  @override
  Widget build(BuildContext context) {
    final postCrt = context.read<PostController>();

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        postCrt.comments.clear();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Comments")),
        body: Selector<PostController, ApiStatus>(
          selector: (p0, p1) => p1.commentsStatus,
          builder: (_, commentsStatus, _) {
            if (commentsStatus == ApiStatus.loading) {
              return LinearProgressIndicator();
            }

            if (commentsStatus == ApiStatus.fail) {
              return Center(child: Text("Error"));
            }

            return ListView.builder(
              itemCount: postCrt.comments.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(postCrt.comments[index].body),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
