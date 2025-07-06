// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IconButton widget')),
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: IconButton(
            tooltip: 'onLongPress',
            // padding: EdgeInsets.all(30),
            alignment: Alignment.bottomLeft,
            onPressed: true
                ? () {
                    print('onPressed');
                  }
                : null,
            // onLongPress: () {
            //   print('onLongPress');
            // },
            color: Colors.red,
            disabledColor: Colors.black,
            iconSize: 30,
            icon: Icon(Icons.logout),
          ),
        ),
      ),
    );
  }
}
