import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;

  void increment() {
    counter++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('$counter')));
  }
}

class MyWidget2 extends StatelessWidget {
  const MyWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<_MyWidgetState> key = GlobalKey<_MyWidgetState>();
    key.currentState!.increment();

    return const Placeholder();
  }
}
