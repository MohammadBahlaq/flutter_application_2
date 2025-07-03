import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int x = 0;
    int y = 8;
    return Scaffold(
      appBar: AppBar(title: Text('SizedBox widget')),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Container(height: 100, width: 100, color: Colors.red),
          // SizedBox(height: 10),
          // Container(height: 100, width: 100, color: Colors.blue),
          // SizedBox(height: 10),
          // Container(height: 100, width: 100, color: Colors.green),
          x == y ? Text('data') : SizedBox.shrink(),
          SizedBox.square(dimension: 100, child: Container(color: Colors.red)),
          SizedBox.fromSize(size: Size(50, 10)),
          SizedBox(height: 50, width: 10),
        ],
      ),
    );
  }
}
