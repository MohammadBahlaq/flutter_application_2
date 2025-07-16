import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

abstract class AppLauncher {
  static Future<void> openUrl(String url) async {
    // if (!await canLaunchUrlString(url)) {
    //   log('The Uri is not valid');
    //   return;
    // }

    await launchUrl(Uri.parse(url));
  }

  static Future<void> openLinkedIn(String name) async {
    final Uri linkedIn = Uri.parse('https://jo.linkedin.com/in/$name');

    if (!await launchUrl(linkedIn)) {
      throw 'The Uri is not valid';
    }
  }

  static Future<void> openWhatsup(String phoneNumber, {String? message}) async {
    Uri whatsupUri = Uri.parse("https://wa.me/$phoneNumber?text=$message");

    if (!await canLaunchUrl(whatsupUri)) {
      log('The Uri is not valid');
      return;
    }

    await launchUrl(whatsupUri);
  }

  static Future<void> sendSms(String phoneNumber, {String? message}) async {
    final Uri smsUri = Uri.parse("sms:$phoneNumber?body=$message");

    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'The Uri is not valid';
    }
  }

  static Future<void> callPhone(String phoneNumber) async {
    final Uri uri = Uri.parse("tel:$phoneNumber");

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'The Uri is not valid';
    }
  }

  static Future<void> openGoogleMap(double latitude, double longitude) async {
    final Uri googleMapUri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );
    if (await canLaunchUrl(googleMapUri)) {
      await launchUrl(googleMapUri);
    } else {
      throw 'The Uri is not valid';
    }
  }

  static Future<void> sendEmail(
    String email, {
    String? body,
    String? subject,
  }) async {
    final Uri emailUri = Uri.parse("mailto:$email?subject=$subject&body=$body");

    if (!await launchUrl(emailUri)) {
      throw 'The Uri is not valid';
    }
  }
}
