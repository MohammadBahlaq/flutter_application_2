import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_images.dart';
import 'package:lottie/lottie.dart';

class LottiePackage extends StatelessWidget {
  const LottiePackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PermissionHandler package')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppImages.loadingLottie,
              height: 100,
              width: 100,
              repeat: true,
              reverse: false,
            ),
            SizedBox(height: 20),

            Lottie.network(
              'https://assets10.lottiefiles.com/packages/lf20_iwmd6pyr.json',
              height: 100,
              width: 100,
              repeat: true,
              reverse: false,
            ),
          ],
        ),
      ),
    );
  }
}
