import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Divider widget')),
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Expanded(
      //       child: Divider(
      //         thickness: 5,
      //         color: Colors.amber,
      //         height: 30,
      //         indent: 5,
      //         endIndent: 5,
      //       ),
      //     ),
      //     Text('Text'),
      //     Expanded(
      //       child: Divider(
      //         thickness: 5,
      //         color: Colors.amber,
      //         height: 30,
      //         indent: 5,
      //         endIndent: 5,
      //       ),
      //     ),
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 50, width: 50, color: Colors.red),
          Divider(
            thickness: 5,
            color: Colors.amber,
            height: 30,
            indent: 50,
            endIndent: 50,
          ),
          Container(height: 50, width: 50, color: Colors.blue),
          Divider(
            thickness: 5,
            color: Colors.amber,
            height: 30,
            indent: 50,
            endIndent: 50,
          ),
          Container(height: 50, width: 50, color: Colors.green),
          Divider(
            thickness: 5,
            color: Colors.amber,
            height: 30,
            indent: 50,
            endIndent: 50,
          ),
          Container(height: 50, width: 50, color: Colors.black),
        ],
      ),
    );
  }
}
