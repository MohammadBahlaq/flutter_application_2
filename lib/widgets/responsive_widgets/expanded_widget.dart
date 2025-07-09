import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded widget')),
      body: Column(children: []),
    );
  }
}
