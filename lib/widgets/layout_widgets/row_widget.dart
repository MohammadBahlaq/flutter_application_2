import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row widget')),
      body: Material(
        color: Colors.greenAccent,
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: 50, width: 50, color: Colors.red),
              SizedBox(width: 10),
              Container(height: 50, width: 50, color: Colors.blue),
              SizedBox(width: 10),
              Container(height: 50, width: 50, color: Colors.green),
              SizedBox(width: 10),
              Container(height: 50, width: 50, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

///Container
///Image
///ClipOval & ClipRRect
///Card
///CircleAvatar
///Padding
///Align
///Row
