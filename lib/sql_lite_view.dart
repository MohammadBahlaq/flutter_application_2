import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/get_it.dart';
import 'package:flutter_application_2/core/sql_lite.dart';

class SqlLiteView extends StatelessWidget {
  const SqlLiteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SqlLite storge")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Insert"),
              onPressed: () {
                List<Map<String, Object?>> data = [
                  {"name": "Ahmad", "age": 25},
                  {"name": "Mohammad", "age": 30},
                ];

                getIt.get<SqlLiteDB>().insert("Students", data);
              },
            ),
            ElevatedButton(
              child: Text("Select"),
              onPressed: () async {
                getIt.get<SqlLiteDB>().getAll("Students");
              },
            ),
            ElevatedButton(
              child: Text("Update"),
              onPressed: () {
                getIt.get<SqlLiteDB>().update(
                  "Students",
                  "name='Mohammad', age = 70",
                  'where age = 30',
                );
              },
            ),
            ElevatedButton(
              child: Text("Delete"),
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => PopScope(
                    canPop: false,
                    child: AlertDialog(content: Text("Loading...")),
                  ),
                );

                await Future.delayed(Duration(seconds: 3));
                // await SqlLiteDB.instance.delete("Students", '');
                await getIt.get<SqlLiteDB>().delete("Students", '');

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
