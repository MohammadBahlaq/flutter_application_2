import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FloatingActionButton widget')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton');
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 20,
        // mini: true,
        splashColor: Colors.red,
        tooltip: 'Increment',
        // shape: CircleBorder(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Icon(Icons.add),
      ),
    );
  }
}
