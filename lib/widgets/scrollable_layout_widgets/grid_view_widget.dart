import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/scrollable_layout_widgets/list_view_widget.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView widget')),

      body: GridView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        physics: BouncingScrollPhysics(),
        reverse: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 150,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15,
          childAspectRatio: 9 / 16,
        ),
        children: [
          Container(color: Colors.black),
          ListView.builder(
            itemBuilder: (_, index) => CustomWidget(index: index),
          ),
          Material(color: Colors.blue, child: Text('data')),
          Container(color: Colors.purple),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
        ],
      ),

      // body: GridView.builder(
      //   itemCount: 10,
      //   scrollDirection: Axis.horizontal,
      //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent: 200,
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 20,
      //   ),
      //   itemBuilder: (context, index) {
      //     return Container(
      //       color: index.isOdd ? Colors.red : Colors.green,
      //       alignment: Alignment.center,
      //       child: Text('$index'),
      //     );
      //   },
      // ),
    );
  }
}
