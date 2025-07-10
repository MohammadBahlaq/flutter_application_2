import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget {
  const FittedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FittedBox widget')),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.amber,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(Icons.add, size: 140),
          ),
        ),
      ),
      // body: Center(
      //   child: FittedBox(
      //     child: Container(
      //       height: 100,
      //       width: 100,
      //       color: Colors.amber,
      //       alignment: Alignment.center,
      //       child: Icon(Icons.add, size: 140),
      //     ),
      //   ),
      // ),
    );
  }
}
