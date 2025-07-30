import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/view/show_posts_view.dart';
import 'package:flutter_application_2/core/get_it.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:flutter_application_2/provider/controller/theme_controller.dart';
import 'package:flutter_application_2/widgets/navigation_widgets/navigation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_navigation/short_navigation.dart';

late SharedPreferences prefs;
late FlutterSecureStorage secureStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 5),
    ),
  );
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  await MediaStore.ensureInitialized();
  MediaStore.appFolder = "MyAppFolder";

  prefs = await SharedPreferences.getInstance();

  secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  setup();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),

      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,

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
            home: ShowPostsView(),
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
