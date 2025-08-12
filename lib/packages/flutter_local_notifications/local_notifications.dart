import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

/// A service to handle Firebase notifications and local notifications.
/// It initializes Firebase messaging, sets up local notifications,

class NotificationsService {
  NotificationsService._();

  static NotificationsService instance = NotificationsService._();

  final _locafNotifications = FlutterLocalNotificationsPlugin();

  bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> init() async {
    initializeTimeZones();
    setLocalLocation(getLocation(await FlutterTimezone.getLocalTimezone()));

    await setupLocalNotifications();
    // await schedualNotifications("تذكير", "لديك درس بعد ساعتين", 11, 15);
  }

  AndroidNotificationChannel get getAndroidChannel {
    return const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
      playSound: true,
    );
  }

  NotificationDetails get getNotificationDetailes {
    final channel = getAndroidChannel;

    return NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        importance: Importance.max,
        priority: Priority.max,
        icon: '@mipmap/launcher_icon',
      ),
      iOS: const DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification(String title, String body) async {
    await _locafNotifications.show(
      1,
      title,
      body,
      getNotificationDetailes,
      payload: "payload",
    );
  }

  Future<void> schedualNotifications(
    String title,
    String body,
    int hour,
    int minits,
  ) async {
    DateTime currentDate = DateTime.now();

    TZDateTime tzDateTime = TZDateTime(
      local,
      currentDate.year,
      currentDate.month,
      currentDate.day,
      hour,
      minits,
    );

    if (tzDateTime.isBefore(DateTime.now())) {
      tzDateTime = tzDateTime.add(const Duration(days: 1));
    }

    await _locafNotifications.zonedSchedule(
      0,
      title,
      body,
      tzDateTime,
      // TZDateTime.now(local).add(Duration(seconds: 5)),
      getNotificationDetailes,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  //!Set Local Notifications
  Future<void> setupLocalNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) return;

    await _implementationChanel();

    await _initializeLocalNotifications();

    _isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> _implementationChanel() async {
    if (Platform.isAndroid) {
      AndroidFlutterLocalNotificationsPlugin? androidPlugin =
          _locafNotifications
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();

      await androidPlugin?.createNotificationChannel(getAndroidChannel);

      await androidPlugin?.requestExactAlarmsPermission();

      await androidPlugin?.requestNotificationsPermission();
    } else if (Platform.isIOS) {
      IOSFlutterLocalNotificationsPlugin? iosPlugin = _locafNotifications
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();

      await iosPlugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Future<void> _initializeLocalNotifications() async {
    const initializationSettingsIOS = DarwinInitializationSettings();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/launcher_icon');

    const initializationSettings = InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    await _locafNotifications.initialize(initializationSettings);
  }
}
