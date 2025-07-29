import 'package:flutter/material.dart';

class FirebaseCrashes extends StatelessWidget {
  const FirebaseCrashes({super.key});

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
