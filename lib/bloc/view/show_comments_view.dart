import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/post_cubit/post_cubit.dart';
import 'package:flutter_application_2/bloc/post_cubit/post_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowComments extends StatelessWidget {
  const ShowComments({super.key});

  @override
  Widget build(BuildContext context) {
    final postCrt = context.read<PostCubit>();

    return Scaffold(
      appBar: AppBar(title: Text("Comments")),
      body: BlocBuilder<PostCubit, PostStateCubit>(
        builder: (_, state) {
          if (state is PostLoadingCubit) {
            return LinearProgressIndicator();
          }

          if (state is PostFailCubit) {
            return Center(child: Text("Error"));
          }

          if (state is PostSuccessCubit) {
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
