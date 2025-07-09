import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/widgets/scrollable_layout_widgets/list_view_widget.dart';

class ScrollControllerExample extends StatefulWidget {
  const ScrollControllerExample({super.key});

  @override
  State<ScrollControllerExample> createState() =>
      _ScrollControllerExampleState();
}

class _ScrollControllerExampleState extends State<ScrollControllerExample> {
  late ScrollController scrollController;

  @override
  void initState() {
    //! Used with SingleChildScrollView, ListView, GridView
    scrollController = ScrollController(initialScrollOffset: 800);

    scrollController.addListener(() {
      var direction = scrollController.position.userScrollDirection;

      if (direction == ScrollDirection.forward) {
        log("forward");
      } else if (direction == ScrollDirection.reverse) {
        log("reverse");
      } else if (direction == ScrollDirection.idle) {
        log("idle");
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ScrollController')),
      body: ListView.separated(
        controller: scrollController,
        itemCount: 100,
        reverse: false,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        shrinkWrap: false,
        separatorBuilder: (_, index) => SizedBox(height: 10),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              // scrollController.jumpTo(800);

              // scrollController.animateTo(
              //   800,
              //   duration: Duration(seconds: 1),
              //   curve: Curves.easeInBack,
              // );

              log(scrollController.offset.toString());
              log(scrollController.position.maxScrollExtent.toString());
              log(scrollController.position.minScrollExtent.toString());
              log(scrollController.position.atEdge.toString());

              var direction = scrollController.position.userScrollDirection;

              if (direction == ScrollDirection.forward) {
                log("forward");
              } else if (direction == ScrollDirection.reverse) {
                log("reverse");
              } else if (direction == ScrollDirection.idle) {
                log("idle");
              }
            },
            child: CustomWidget(index: index),
          );
        },
      ),
    );
  }
}
