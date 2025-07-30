import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/cubits/post_cubit/post_cubit.dart';
import 'package:flutter_application_2/bloc/cubits/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowComments extends StatelessWidget {
  const ShowComments({super.key});

  @override
  Widget build(BuildContext context) {
    final postCrt = context.read<PostCubit>();

    return Scaffold(
      appBar: AppBar(title: Text("Comments")),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (_, state) {
          if (state is PostLoading) {
            return LinearProgressIndicator();
          }

          if (state is PostFail) {
            return Center(child: Text("Error"));
          }

          if (state is PostSuccess) {
            return ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(state.comments[index].body),
                  ),
                );
              },
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
