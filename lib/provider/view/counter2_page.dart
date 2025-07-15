import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/controller/counter_controller.dart';
import 'package:provider/provider.dart';

class Counter2Page extends StatelessWidget {
  const Counter2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCrt = context.read<CounterController>();

    return Scaffold(
      appBar: AppBar(title: Text("Counter 2")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counterCrt.increment();
          // counterCrt.increment2();
        },
      ),
      body: Center(
        child: Text("${counterCrt.counter}", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
