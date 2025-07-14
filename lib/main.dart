import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/get_it.dart';
import 'package:flutter_application_2/sql_lite_view.dart';
import 'package:flutter_application_2/widgets/navigation_widgets/navigation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
late FlutterSecureStorage secureStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  setup();

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
      home: SqlLiteView(),
      routes: {
        "/PageOne": (_) => PageOne(),
        "PageTwo": (_) => PageTwo(name: ''),
        "PageThree": (_) => PageThree(),
      },
    );
  }
}
