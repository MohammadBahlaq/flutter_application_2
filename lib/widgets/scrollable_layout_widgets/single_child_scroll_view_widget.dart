import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_images.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  const SingleChildScrollViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView widget"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // body: SingleChildScrollView(
      //   padding: EdgeInsets.all(15),
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     children: [
      //       Image.asset(AppImages.garden, fit: BoxFit.fill),
      //       SizedBox(width: 10),
      //       Image.asset(AppImages.garden, fit: BoxFit.fill),
      //       SizedBox(width: 10),
      //       Image.asset(AppImages.garden, fit: BoxFit.fill),
      //       SizedBox(width: 10),
      //       Image.asset(AppImages.garden, fit: BoxFit.fill),
      //       SizedBox(width: 10),
      //       Image.asset(AppImages.garden, fit: BoxFit.fill),
      //       SizedBox(width: 10),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        reverse: false,
        // controller: ScrollController(), //! We will take it later
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.garden2, fit: BoxFit.fill),
            SizedBox(height: 10),
            Image.asset(AppImages.garden, fit: BoxFit.fill),
            SizedBox(height: 10),
            Image.asset(AppImages.garden, fit: BoxFit.fill),
            SizedBox(height: 10),
            Image.asset(AppImages.garden, fit: BoxFit.fill),
            SizedBox(height: 10),
            Image.asset(AppImages.garden, fit: BoxFit.fill),
            SizedBox(height: 10),
          ],
        ),
      ),

      // body: SingleChildScrollView(
      //   physics: BouncingScrollPhysics(),
    );
  }
}
