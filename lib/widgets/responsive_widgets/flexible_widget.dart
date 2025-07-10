import 'package:flutter/material.dart';

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flexible widget')),
      body: Column(
        children: [
          Flexible(flex: 2, child: Container(color: Colors.red, height: 290)),
          Flexible(child: Container(color: Colors.blue, height: 200)),
          Flexible(child: Container(color: Colors.black, height: 200)),
          Flexible(child: Container(color: Colors.green, height: 200)),
        ],
      ),
    );
  }
}
