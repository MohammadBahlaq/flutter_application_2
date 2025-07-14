import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/prefs_keys.dart';
import 'package:flutter_application_2/main.dart';

class SecureStorgePackage extends StatefulWidget {
  const SecureStorgePackage({super.key});

  @override
  State<SecureStorgePackage> createState() => _SecureStorgePackageState();
}

class _SecureStorgePackageState extends State<SecureStorgePackage> {
  late int counter;
  // bool isLoading = true;

  Future<void> initCounter() async {
    counter = int.parse(
      await secureStorage.read(key: PrefsKeys.counter) ?? "0",
    );
    // isLoading = false;
    // await Future.delayed(Duration(seconds: 2));
    // setState(() {});
  }

  @override
  void initState() {
    initCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecureStorge package')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counter++;
          secureStorage.write(key: PrefsKeys.counter, value: "$counter");
          setState(() {});
        },
      ),

      body: FutureBuilder(
        future: secureStorage.read(key: PrefsKeys.counter),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text(
                '${snapshot.data ?? 0}',
                style: TextStyle(fontSize: 30),
              ),
            );
          }

          return Center(child: Text("Error"));
        },
      ),

      // body: Center(
      //   child: isLoading
      //       ? CircularProgressIndicator()
      //       : Text('$counter', style: TextStyle(fontSize: 30)),
      // ),
    );
  }
}
