import 'dart:developer';

import 'package:flutter/material.dart';

class DateformateExample extends StatelessWidget {
  const DateformateExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DateFormate example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                DateTime now = DateTime.now();
                DateTime nowAdd30Days = DateTime.now().add(Duration(days: 30));
                DateTime nowSubtract30Days = DateTime.now().subtract(
                  Duration(days: 30),
                );

                // log(now.toString());
                // log(nowAdd30Days.toString());
                // log(nowSubtract30Days.toString());

                // int number = nowAdd30Days.compareTo(now);
                // log(number.toString());
                // log(DateFormat("yyyy-MM-dd", "en").format(now));
                // log(now.toString());
                // log(DateFormat("yyyy-MM-dd").parse("31-7-2025").toString());

                // log(now.copyWith(month: 8).toString());
                // log(now.isBefore(nowAdd30Days).toString());
                // log(nowAdd30Days.isAfter(now).toString());

                Duration duration = now.difference(nowAdd30Days);

                log(duration.inDays.toString());
                log(duration.inHours.toString());
                log((duration.inDays / 30).abs().toString());
                log(
                  Duration(days: 15).compareTo(Duration(days: 30)).toString(),
                );
              },
              child: Text("Formate Date"),
            ),
          ],
        ),
      ),
    );
  }
}
