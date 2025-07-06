import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_images.dart';

class GestureInkwellButtons extends StatelessWidget {
  const GestureInkwellButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture & Inkwell"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {},
            onDoubleTap: () {
              print('onDoubleTap');
            },
            onLongPress: () {
              print('onLongPress');
            },
            onLongPressCancel: () {
              print('onLongPressCancel');
            },
            child: Image.asset(AppImages.garden),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {},
            onDoubleTap: () {
              print('onDoubleTap');
            },
            onLongPress: () {
              print('onLongPress');
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     GestureDetector(
      //       onTap: () {
      //         print("onTap");
      //       },
      //       onLongPress: () {
      //         print("onLongPress");
      //       },
      //       onDoubleTap: () {
      //         print("onDoubleTap");
      //       },
      //       child: Image.asset(AppImages.garden),
      //     ),
      //     SizedBox(height: 10),
      //     InkWell(
      //       splashColor: Colors.red,
      //       onTap: () {
      //         print("InkWell");
      //       },
      //       child: Icon(Icons.add),
      //     ),
      //   ],
      // ),
    );
  }
}
