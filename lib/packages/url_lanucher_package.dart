import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_launcher.dart';

class UrlLanucherPackage extends StatelessWidget {
  const UrlLanucherPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UrlLanucher package')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
              ),
              child: Text('Open Url'),
              onPressed: () =>
                  AppLauncher.openUrl("https://pub.dev/packages/url_launcher"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: Text('Open LinkedIn'),
              onPressed: () =>
                  AppLauncher.openLinkedIn('mohammad-bahlaq-089882220'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () => AppLauncher.openWhatsup(
                '+962770355390',
                message: 'شارك هذا الإعلان مع زميلك',
              ),
              child: Text('Open Whatsup'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Send SMS'),
              onPressed: () => AppLauncher.sendSms(
                '0770355390',
                message: 'شارك هذا الإعلان مع زميلك',
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('Call number'),
              onPressed: () => AppLauncher.callPhone('0770355390'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
              ),
              onPressed: () => AppLauncher.openGoogleMap(32, 31),
              child: Text('Open Location'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
              ),
              child: Text('Send Email'),
              onPressed: () => AppLauncher.sendEmail(
                'Bahlaq57@gmail.com',
                body: 'مرحبا كيفك',
                subject: 'مقابلة',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
