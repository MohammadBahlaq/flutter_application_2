import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card widget')),

      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 100,
          //! Shape close to Container
          child: Card(
            color: Colors.red,
            elevation: 50,
            shadowColor: Colors.blue,
            margin: EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            //! if you want to set padding for any widget
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Text'),
            ),
            //! If you want to set alignment for any widget
            // child: Align(
            //   alignment: Alignment.topRight,
            //   child: Text('Text'),
            // ),
          ),
        ),
      ),

      // body: Center(
      //   child: Card(
      //     shape: RoundedRectangleBorder(
      //       side: BorderSide(color: Colors.red, width: 5),
      //       borderRadius: BorderRadius.circular(30),
      //     ),
      //     child: SizedBox(
      //       height: 50,
      //       width: double.infinity,
      //       child: Align(alignment: Alignment.center, child: Text('Text')),
      //     ),
      //   ),
      // ),
    );
  }
}
