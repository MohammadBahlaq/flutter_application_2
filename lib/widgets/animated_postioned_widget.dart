import 'package:flutter/material.dart';

class AnimatedPostionedWidget extends StatefulWidget {
  const AnimatedPostionedWidget({super.key});

  @override
  State<AnimatedPostionedWidget> createState() =>
      _AnimatedPostionedWidgetState();
}

class _AnimatedPostionedWidgetState extends State<AnimatedPostionedWidget> {
  double postion = -400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedPostioned Widget")),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedPositioned(
            top: postion,
            curve: Curves.easeInOut,
            onEnd: () {},
            duration: Duration(seconds: 1),
            child: Container(height: 400, width: 200, color: Colors.red),
          ),
          ElevatedButton(
            onPressed: () {
              if (postion == 0) {
                postion = -400;
              } else {
                postion = 0;
              }

              setState(() {});
            },
            child: Text("Show"),
          ),
        ],
      ),
    );
  }
}
