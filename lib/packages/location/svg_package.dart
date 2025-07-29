import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPackage extends StatelessWidget {
  const SvgPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('SVG package')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
              child: SvgPicture.asset(
                AppImages.home,
                height: 100,
                width: 100,
                // color: Colors.blue,
                colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                fit: BoxFit.scaleDown,
              ),
            ),

            SvgPicture.network(
              'https://www.svgrepo.com/show/316860/folder-simple.svg',
              height: 100,
              width: 100,
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
            ),

            // Container(
            //   color: Colors.red,
            //   height: 200,
            //   width: 200,
            //   child: SvgPicture.network(
            //     'https://www.svgrepo.com/show/316860/folder-simple.svg',
            //     // fit: BoxFit.fill,
            //   ),
            // ),
            // SizedBox(height: 20),
            // SvgPicture.asset(
            //   AppImages.attendanceFingerprint,
            //   fit: BoxFit.scaleDown,
            //   colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            // ),
          ],
        ),
      ),
    );
  }
}
