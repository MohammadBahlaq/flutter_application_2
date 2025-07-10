import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wrap widget')),
      body: SizedBox.expand(
        child: Wrap(
          // alignment: WrapAlignment.spaceBetween,
          // textDirection: TextDirection.ltr,
          // direction: Axis.vertical,
          // verticalDirection: VerticalDirection.up,
          // spacing: 20,
          // runSpacing: 20,
          // runAlignment: WrapAlignment.spaceBetween,
          children: List.generate(
            15,
            (index) => Container(
              height: 80,
              width: 80,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text('$index', style: TextStyle(fontSize: 30)),
            ),
          ),
        ),
      ),

      // body: SizedBox.expand(
      //   child: Wrap(
      //     runAlignment: WrapAlignment.spaceBetween,
      //     children: List.generate(
      //       15,
      //       (index) => Container(
      //         height: 80,
      //         width: 80,
      //         color: Colors.red,
      //         alignment: Alignment.center,
      //         child: Text('$index', style: TextStyle(fontSize: 30)),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
