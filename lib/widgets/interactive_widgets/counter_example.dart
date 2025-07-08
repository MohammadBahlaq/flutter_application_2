import 'package:flutter/material.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter example')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("$counter");
          counter++;
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: Center(child: Text('$counter', style: TextStyle(fontSize: 30))),
    );
  }
}
