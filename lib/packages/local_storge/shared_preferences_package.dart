import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/prefs_keys.dart';
import 'package:flutter_application_2/main.dart';

class SharedPreferencesPackage extends StatefulWidget {
  const SharedPreferencesPackage({super.key});

  @override
  State<SharedPreferencesPackage> createState() =>
      _SharedPreferencesPackageState();
}

class _SharedPreferencesPackageState extends State<SharedPreferencesPackage> {
  late int counter;

  @override
  void initState() {
    counter = prefs.getInt(PrefsKeys.counter) ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('SharedPreferences package')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          counter++;
          await prefs.setInt(PrefsKeys.counter, counter);
          setState(() {});
        },
      ),
      body: Center(child: Text('$counter', style: TextStyle(fontSize: 30))),
    );
  }
}
