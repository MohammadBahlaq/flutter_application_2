import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      // body: Center(
      //   child: Image.asset(
      //     AppImages.garden,
      //     height: 200,
      //     width: 200,
      //     fit: BoxFit.fill,
      //     opacity: AlwaysStoppedAnimation(1), //! passing value without animations
      //   ),
      // ),

      // body: Center(
      //!If you want to clip any widget to be circle
      //   child: ClipOval(
      //     child: Image.network(
      //       "https://i.guim.co.uk/img/media/9f1b249e73a0227f6ee0c9991f2dd72d13457e4d/0_128_2816_1690/master/2816.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=e927d7f65e482bbfa244c0916150c3d2",
      //       width: 200,
      //       height: 200,
      //     ),
      //   ),
      // ),
      body: Center(
        child: ClipRRect(
          //! If you want to set raduis for any widget
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            "https://i.guim.co.uk/img/media/9f1b249e73a0227f6ee0c9991f2dd72d13457e4d/0_128_2816_1690/master/2816.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=e927d7f65e482bbfa244c0916150c3d2",
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
