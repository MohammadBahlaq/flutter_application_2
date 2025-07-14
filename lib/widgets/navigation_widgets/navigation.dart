import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_routes.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (canPop, result) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => PopScope(
              canPop: false,
              child: AlertDialog(
                content: Text("Do you want to leave?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text("Ok"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Chancel"),
                  ),
                ],
              ),
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(title: Text('Page 1')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Go to page 2'),
                  onPressed: () async {
                    // File file = File(
                    //   "/storage/emulated/0/Download/test_file.txt",
                    // );
                    // file.writeAsString("Test Text 2222222");

                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (context) => PopScope(
                    //     canPop: false,
                    //     child: AlertDialog(content: Text("Loading...")),
                    //   ),
                    // );

                    // await Future.delayed(Duration(seconds: 2));

                    // Navigator.of(context).popAndPushNamed(AppRoutes.pageTwo);

                    // Navigator.pushNamed(
                    //   context,
                    //   AppRoutes.pageTwo,
                    //   arguments: "Mohammad",
                    // );

                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) =>
                    //         PageTwo(name: "Mohammad from Constructor"),
                    //     settings: RouteSettings(arguments: "Mohammad"),
                    //   ),
                    // );

                    // Navigator.of(
                    //   context,
                    // ).pushNamed(AppRoutes.pageTwo, arguments: "Mohammad");
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(builder: (context) => PageTwo()),
                    // );

                    Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.pageTwo);
                  },
                  child: Text('Go to page 2 (Home page)'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    String? s = ModalRoute.of(context)!.settings.arguments as String?;

    print(s);

    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go to page 3'),
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => PageThree()));

                // Navigator.of(context).pushNamed(AppRoutes.pageThree);
              },
            ),
            ElevatedButton(
              child: Text('Back to page 1'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Go to page 3 and remove all pages (Home page)'),
              onPressed: () {
                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(builder: (context) => PageThree()),
                //   (route) => false,
                // );

                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.pageThree,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Back to page 2'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Back to page 1'),
              onPressed: () {
                // Navigator.of(context).pop(); //Back to page2
                // Navigator.of(context).pop();

                // Navigator.of(context)
                //   ..pop()
                //   ..pop();

                Navigator.of(
                  context,
                ).popUntil((route) => route.settings.name == AppRoutes.pageTwo);
              },
            ),
          ],
        ),
      ),
    );
  }
}

///Navigator.of(context)
///*push
///*pushNamed
///*pushReplacement
///*pushReplacmentNamed
///*pushAndRemoveUntil
///*pushNamedAndRemoveUntil
///*pop
///*popUntil
///*popAndPushNamed
