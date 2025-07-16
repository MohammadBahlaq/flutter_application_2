import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/controller/post_controller.dart';
import 'package:flutter_application_2/api/view/create_post_view.dart';
import 'package:flutter_application_2/api/view/show_comments_view.dart';
import 'package:flutter_application_2/core/endpoints.dart';
import 'package:provider/provider.dart';
import 'package:short_navigation/short_navigation.dart';

class ShowPostsView extends StatelessWidget {
  const ShowPostsView({super.key});

  @override
  Widget build(BuildContext _) {
    return ChangeNotifierProvider(
      create: (_) => PostController()..getPosts(),
      child: Builder(
        builder: (context) {
          final postCrt = context.read<PostController>();
          // final postCrt = context.watch<PostController>();
          // final postCrt = Provider.of<PostController>(context,listen: false);
          // final postCrt = Provider.of<PostController>(context,listen: true);

          return Scaffold(
            appBar: AppBar(title: Text("Posts")),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Go.to(
                  ChangeNotifierProvider.value(
                    value: postCrt,
                    child: CreatePostView(),
                  ),
                );
              },
            ),
            body: Selector<PostController, ApiStatus>(
              selector: (p0, p1) => p1.postsStatus,
              builder: (_, postsStatus, _) {
                if (postsStatus == ApiStatus.loading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (postsStatus == ApiStatus.fail) {
                  return Center(child: Text("Error"));
                }

                return ListView.builder(
                  itemCount: postCrt.posts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        postCrt.getComments(postCrt.posts[index].id);

                        Go.to(
                          ChangeNotifierProvider.value(
                            value: postCrt,
                            child: ShowComments(),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(postCrt.posts[index].body),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
