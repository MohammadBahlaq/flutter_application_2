import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:short_navigation/short_navigation.dart';

class FirebaseCrashes extends StatefulWidget {
  const FirebaseCrashes({super.key});

  @override
  State<FirebaseCrashes> createState() => _FirebaseCrashesState();
}

class _FirebaseCrashesState extends State<FirebaseCrashes> {
  @override
  void initState() {
    FirebaseRemoteConfig.instance.onConfigUpdated.listen((event) async {
      await FirebaseRemoteConfig.instance.activate();

      if (FirebaseRemoteConfig.instance.getBool(event.updatedKeys.first)) {
        log("message");
        GoMessenger.dialog(
          barrierDismissible: false,
          PopScope(
            canPop: false,
            child: AlertDialog(content: Text("You must update")),
          ),
        );
      }

      log(event.updatedKeys.toString());
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (FirebaseRemoteConfig.instance.getBool("update")) {
        log("message");
        GoMessenger.dialog(
          barrierDismissible: false,
          PopScope(
            canPop: false,
            child: AlertDialog(content: Text("You must update")),
          ),
        );
      }

      log(FirebaseRemoteConfig.instance.getBool("update").toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase")),
      body: Center(
        child: TextButton(
          onPressed: () => throw "Test Error 2",
          child: const Text("Throw Test Exception"),
        ),
      ),
    );
  }
}
