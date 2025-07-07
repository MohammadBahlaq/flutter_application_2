import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_images.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  static const List list = [
    AppImages.garden2,
    AppImages.garden2,
    AppImages.garden2,
    AppImages.garden2,
    AppImages.garden2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView widget')),

      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {},
        // controller: ,
        reverse: false,
        physics: BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(list[index]),
          );
        },
      ),

      // body: PageView(
      //   physics: BouncingScrollPhysics(),
      //   // controller: ,
      //   reverse: true,
      //   scrollDirection: Axis.vertical,
      //   onPageChanged: (index) {
      //     print(index);
      //   },
      //   children: [
      //     Text('The Start'),
      //     Image.asset(AppImages.garden2),
      //     Image.asset(AppImages.garden),
      //     Image.asset(AppImages.garden2),
      //     Image.asset(AppImages.garden),
      //     Text('The End'),
      //   ],
      // ),

      // body: PageView.builder(
      //   scrollDirection: Axis.horizontal,
      //   reverse: false,
      //   physics: BouncingScrollPhysics(),
      //   onPageChanged: (index) {
      //     print(index);
      //   },
      //   itemCount: list.length,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(10),
      //       child: Image.asset(AppImages.garden2),
      //     );
      //   },
      // ),
    );
  }
}
