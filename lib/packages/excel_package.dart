import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class ExcelPackage extends StatelessWidget {
  const ExcelPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Excel package')),
      body: Center(
        child: ElevatedButton(
          onPressed: _exportExcel,
          child: Text('Export excel'),
        ),
      ),
    );
  }

  Future<void> _exportExcel() async {
    // Create a new Excel document.
    final Workbook workbook = Workbook(2);
    //Accessing worksheet via index.
    final Worksheet sheet = workbook.worksheets[0];
    final Worksheet sheet2 = workbook.worksheets[1];
    //Add Text.
    sheet.getRangeByName('A1').setText('Hello World');
    //Add Number
    sheet.getRangeByName('A2').setText("44");
    //Add DateTime
    sheet.getRangeByName('A3').setText("25-11-2025");

    sheet2.getRangeByName('A1').setText('Hello World 2');
    //Add Number
    sheet2.getRangeByName('A2').setText("44 2");
    //Add DateTime
    sheet2.getRangeByName('A3').setText("25-11 2");
    // Save the document.
    final List<int> bytes = workbook.saveAsStream();

    final String path = "/storage/emulated/0/Download/test_file.xlsx";

    File file = File(path);

    await file.writeAsBytes(bytes);

    //Dispose the workbook.
    workbook.dispose();

    await OpenFilex.open(path);
  }
}
