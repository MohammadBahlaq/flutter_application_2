import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_images.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CircleAvatar widget')),

      body: Center(
        child: SizedBox(
          // height: 20,
          //! Container shaped as circle
          child: CircleAvatar(
            backgroundColor: Colors.red,
            // radius: 80,
            minRadius: 40,
            maxRadius: 80,
            //! color for widgets on CircleAvatar
            foregroundColor: Colors.white,
            //! If you pass it, it will containe [backgroundColor]
            backgroundImage: AssetImage(AppImages.garden),
            // foregroundImage: AssetImage(AppImages.garden2),
            child: Text('Text'),
          ),
        ),
      ),
    );
  }
}
