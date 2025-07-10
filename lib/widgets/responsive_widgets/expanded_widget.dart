import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded widget')),
      body: Column(
        children: [
          // TextField(),
          // Expanded(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) => CustomWidget(index: index),
          //   ),
          // ),
          Expanded(flex: 2, child: Container(height: 200, color: Colors.red)),
          Expanded(child: Container(height: 200, color: Colors.blue)),
          Expanded(child: Container(height: 200, color: Colors.black)),
          Expanded(child: Container(height: 200, color: Colors.green)),
        ],
      ),
    );
  }
}
