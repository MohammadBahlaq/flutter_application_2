import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack widget')),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            Container(height: 300, width: 300, color: Colors.red),
            Container(
              // margin: EdgeInsets.only(bottom: 200),
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
            Positioned(
              left: 50,
              top: 250,
              child: Container(height: 100, width: 100, color: Colors.green),
            ),
          ],
        ),
      ),

      // body: Center(
      //   child: Stack(
      //     clipBehavior: Clip.hardEdge,
      //     alignment: Alignment.center,
      //     children: [
      //       Container(height: 300, width: 300, color: Colors.red),
      //       Container(height: 200, width: 200, color: Colors.blue),
      //       Positioned(
      //         top: -25,
      //         child: Container(height: 100, width: 100, color: Colors.green),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
