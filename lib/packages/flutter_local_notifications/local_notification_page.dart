import 'package:flutter/material.dart';
import 'package:flutter_application_2/packages/flutter_local_notifications/local_notifications.dart';

class LocalNotificationPage extends StatelessWidget {
  const LocalNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local notifications")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            NotificationsService.instance.showNotification(
              "العنوان",
              "لا يوجد اتصال بالإنترنت",
            );

            // NotificationsService.instance.schedualNotifications(
            //   "العنوان",
            //   "لا يوجد اتصال بالإنترنت",
            //   14,
            //   34,
            // );
          },
          child: Text("Show Notification"),
        ),
      ),
    );
  }
}
