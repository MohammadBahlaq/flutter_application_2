import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column widget')),
      body: SizedBox(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height: 50, width: 50, color: Colors.red),
            Container(height: 50, width: 50, color: Colors.blue),
            Container(height: 50, width: 50, color: Colors.green),
            Container(height: 50, width: 50, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
