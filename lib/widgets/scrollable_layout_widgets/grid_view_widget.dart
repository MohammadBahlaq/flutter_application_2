import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView widget')),

      // body: GridView(
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   physics: BouncingScrollPhysics(),
      //   reverse: false,
      //   scrollDirection: Axis.vertical,
      //   shrinkWrap: true,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     mainAxisExtent: 150,
      //     mainAxisSpacing: 20,
      //     crossAxisSpacing: 15,
      //     childAspectRatio: 9 / 16,
      //   ),
      //   children: [
      //     Container(color: Colors.black),
      //     ListView.builder(
      //       itemBuilder: (_, index) => CustomWidget(index: index),
      //     ),
      //     Material(color: Colors.blue, child: Text('data')),
      //     Container(color: Colors.purple),
      //     Container(color: Colors.green),
      //     Container(color: Colors.yellow),
      //   ],
      // ),
      body: GridView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: index.isOdd ? Colors.red : Colors.green,
            alignment: Alignment.center,
            child: Text('$index'),
          );
        },
      ),

      // body: GridView.builder(
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   physics: BouncingScrollPhysics(),
      //   reverse: false,
      //   scrollDirection: Axis.vertical,
      //   shrinkWrap: true,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 15,
      //     mainAxisSpacing: 20,
      //     mainAxisExtent: 150,
      //   ),
      //   itemCount: 15,
      //   itemBuilder: (context, index) {
      //     return Container(
      //       color: index.isOdd ? Colors.red : Colors.green,
      //       alignment: Alignment.center,
      //       child: Text('$index'),
      //     );
      //   },
      // ),

      // body: GridView(
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   physics: BouncingScrollPhysics(),
      //   reverse: false,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 15,
      //     mainAxisSpacing: 20,
      //     mainAxisExtent: 150,
      //   ),
      //   children: [
      //     Container(color: Colors.red),
      //     Container(color: Colors.blue),
      //     Container(color: Colors.green),
      //     Container(color: Colors.black),
      //     Container(color: Colors.purple),
      //     Text("data"),
      //     Text("data"),
      //     Text("data"),
      //     Icon(Icons.add),
      //     Icon(Icons.remove),
      //     Icon(Icons.shopping_cart),
      //     Icon(Icons.delete),
      //   ],
      // ),
    );
  }
}
