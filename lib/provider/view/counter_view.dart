import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/controller/counter_controller.dart';
import 'package:flutter_application_2/provider/view/counter2_page.dart';
import 'package:provider/provider.dart';

class ProviderPackage extends StatelessWidget {
  const ProviderPackage({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CounterController())],
      child: Builder(
        builder: (context) {
          final counterCrt = context.read<CounterController>();

          return Scaffold(
            appBar: AppBar(title: Text('Provider package')),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                counterCrt.increment();
                // counterCrt.increment2();
              },
            ),

            //!Conumer
            body: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider.value(
                      value: counterCrt,
                      child: Counter2Page(),
                    ),
                  ),
                );
              },
              child: Center(
                child: Consumer<CounterController>(
                  builder: (context, counterCrt, child) {
                    print("Consumer rebuild");
                    return Text(
                      '${counterCrt.counter}',
                      style: TextStyle(fontSize: 30),
                    );
                  },
                ),
              ),
            ),

            //!Selector
            // body: Center(
            //   child: Selector<CounterController, (int, int)>(
            //     selector: (_, p1) => (p1.counter, p1.counter2),
            //     builder: (_, record, _) {
            //       print("Selector rebuild");
            //       return Text(
            //         '${record.$1} , ${record.$2}',
            //         style: TextStyle(fontSize: 30),
            //       );
            //     },
            //   ),
            // ),

            //!Selector2
            // body: Center(
            //   child:
            //       Selector2<CounterController, CounterController, (int, int)>(
            //         selector: (_, p1,p2) => (p1.counter, p2.counter2),
            //         builder: (_, record, _) {
            //           print("Selector rebuild");
            //           return Text(
            //             '${record.$1} , ${record.$2}',
            //             style: TextStyle(fontSize: 30),
            //           );
            //         },
            //       ),
            // ),
          );
        },
      ),
    );
  }
}
