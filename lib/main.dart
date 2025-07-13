import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/navigation_widgets/navigation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
late FlutterSecureStorage secureStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  secureStorage = FlutterSecureStorage(
    aOptions: const AndroidOptions(encryptedSharedPreferences: true),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: PageOne(),
      routes: {
        "PageOne": (_) => PageOne(),
        "PageTwo": (_) => PageTwo(),
        "PageThree": (_) => PageThree(),
      },

      // routes: {
      //   'pageOne': (_) => PageOne(),
      //   'pageTwo': (_) => PageTwo(),
      //   'pageThree': (_) => PageThree(),
      // },
    );
  }
}
