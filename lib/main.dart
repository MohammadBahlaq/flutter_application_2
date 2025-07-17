import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/get_it.dart';
import 'package:flutter_application_2/packages/google_maps.dart';
import 'package:flutter_application_2/provider/controller/theme_controller.dart';
import 'package:flutter_application_2/widgets/navigation_widgets/navigation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_navigation/short_navigation.dart';

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
    // var x = ThemeController();
    // x.initTheme();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()..initTheme()),
      ],
      child: Selector<ThemeController, ThemeMode>(
        selector: (p0, p1) => p1.themeMode,
        shouldRebuild: (previous, next) => true,
        builder: (context, themeMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            navigatorKey: Go.navigatorKey,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.brown,
            ),
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              // elevatedButtonTheme: ElevatedButtonThemeData(
              //   style: ElevatedButton.styleFrom(),
              // ),
              // appBarTheme: AppBarTheme(centerTitle: true),
              // radioTheme: RadioThemeData(),
              // checkboxTheme: CheckboxThemeData(),
              // dialogTheme: DialogThemeData(),
              // scaffoldBackgroundColor: Colors.blue,
            ),
            home: MapSample(),
            routes: {
              "/PageOne": (_) => PageOne(),
              "PageTwo": (_) => PageTwo(name: ''),
              "PageThree": (_) => PageThree(),
            },
          );
        },
      ),
    );
  }
}
