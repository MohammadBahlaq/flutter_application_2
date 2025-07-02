import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Icon Widget")),
      body: Center(
        child: Icon(
          //! to set the icon from Icons class
          Icons.notifications,
          //! to set Icon's size
          size: 24,
          //! to set Icon color
          color: Colors.white,
        ),
      ),
    );
  }
}
