import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  static const List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView.separated(
        itemCount: list.length,
        reverse: false,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        // controller: ,
        padding: EdgeInsets.all(10),
        shrinkWrap: false,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          return CustomWidget(index: index);
        },
      ),

      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       ListView.builder(
      //         padding: EdgeInsets.all(15),
      //         physics: BouncingScrollPhysics(),
      //         reverse: false,
      //         // scrollDirection: Axis.horizontal,
      //         shrinkWrap: true,
      //         itemCount: list.length,
      //         itemBuilder: (context, index) {
      //           return CustomWidget(index: list[index]);
      //         },
      //       ),
      //       ListView.builder(
      //         padding: EdgeInsets.all(15),
      //         physics: BouncingScrollPhysics(),
      //         reverse: false,
      //         // scrollDirection: Axis.horizontal,
      //         shrinkWrap: true,
      //         itemCount: list.length,
      //         itemBuilder: (context, index) {
      //           return CustomWidget(index: list[index]);
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      //CustomScrollView //SliverList

      //!Column + SingleChildScrollView
      // body: ListView(
      //   padding: EdgeInsets.all(15),
      //   physics: BouncingScrollPhysics(),
      //   reverse: true,
      //   scrollDirection: Axis.vertical,
      //   // shrinkWrap: true,
      //   children: [
      //     SizedBox(
      //       height: 100,
      //       child: ListView.builder(
      //         itemBuilder: (context, index) => CustomWidget(index: index),
      //       ),
      //     ),
      //     Container(height: 100, width: 100, color: Colors.red),
      //     SizedBox(width: 10),
      //     Container(height: 100, width: 100, color: Colors.blue),
      //     SizedBox(width: 10),
      //     Container(height: 100, width: 100, color: Colors.green),
      //     SizedBox(width: 10),
      //     Container(height: 100, width: 100, color: Colors.black),
      //     SizedBox(width: 10),
      //     Container(height: 100, width: 100, color: Colors.purple),
      //     SizedBox(width: 10),
      //     Container(height: 100, width: 100, color: Colors.yellow),
      //     SizedBox(width: 10),
      //     Container(height: 100, width: 100, color: Colors.brown),
      //     SizedBox(width: 10),
      //     Container(height: 100, width: 100, color: Colors.grey),
      //     SizedBox(width: 10),
      //   ],
      // ),

      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 200,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               width: 100,
      //               color: Colors.red,
      //               margin: EdgeInsets.all(5),
      //               alignment: Alignment.center,
      //               child: Text('$index', style: TextStyle(fontSize: 30)),
      //             );
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         height: 200,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               width: 100,
      //               color: Colors.blue,
      //               margin: EdgeInsets.all(5),
      //               alignment: Alignment.center,
      //               child: Text('$index', style: TextStyle(fontSize: 30)),
      //             );
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         height: 200,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               width: 100,
      //               color: Colors.green,
      //               margin: EdgeInsets.all(5),
      //               alignment: Alignment.center,
      //               child: Text('$index', style: TextStyle(fontSize: 30)),
      //             );
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         height: 200,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               width: 100,
      //               color: Colors.purple,
      //               margin: EdgeInsets.all(5),
      //               alignment: Alignment.center,
      //               child: Text('$index', style: TextStyle(fontSize: 30)),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // body: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text('Top Rated'),
      //       SizedBox(
      //         height: 200,
      //         child: ListView.builder(
      //           padding: EdgeInsets.symmetric(horizontal: 20),
      //           scrollDirection: Axis.horizontal,
      //           physics: BouncingScrollPhysics(),
      //           reverse: true,
      //           itemCount: list.length,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               width: 100,
      //               color: Colors.red,
      //               margin: EdgeInsets.only(right: 10),
      //               alignment: Alignment.center,
      //               child: Text('$index', style: TextStyle(fontSize: 30)),
      //             );
      //           },
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       Text('Favorite'),
      //       SizedBox(
      //         height: 200,
      //         child: ListView.builder(
      //           padding: EdgeInsets.symmetric(horizontal: 20),
      //           scrollDirection: Axis.horizontal,
      //           physics: BouncingScrollPhysics(),
      //           reverse: false,
      //           itemCount: list.length,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               width: 100,
      //               color: Colors.blue,
      //               margin: EdgeInsets.only(right: 10),
      //               alignment: Alignment.center,
      //               child: Text('$index', style: TextStyle(fontSize: 30)),
      //             );
      //           },
      //         ),
      //       ),
      //       Text('History'),
      //       SizedBox(
      //         height: 200,
      //         child: ListView.builder(
      //           padding: EdgeInsets.symmetric(horizontal: 20),
      //           scrollDirection: Axis.horizontal,
      //           physics: BouncingScrollPhysics(),
      //           reverse: false,
      //           itemCount: list.length,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               width: 100,
      //               color: Colors.green,
      //               margin: EdgeInsets.only(right: 10),
      //               alignment: Alignment.center,
      //               child: Text('$index', style: TextStyle(fontSize: 30)),
      //             );
      //           },
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       SizedBox(
      //         height: 200,
      //         child: ListView.builder(
      //           padding: EdgeInsets.symmetric(horizontal: 20),
      //           scrollDirection: Axis.horizontal,
      //           physics: BouncingScrollPhysics(),
      //           reverse: false,
      //           itemCount: list.length,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               width: 100,
      //               color: Colors.purple,
      //               margin: EdgeInsets.only(right: 10),
      //               alignment: Alignment.center,
      //               child: Text('$index', style: TextStyle(fontSize: 30)),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.red,
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      child: Text('$index', style: TextStyle(fontSize: 30)),
    );
  }
}
