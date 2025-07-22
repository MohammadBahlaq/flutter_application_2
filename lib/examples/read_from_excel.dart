// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

class ReadFromExcel extends StatefulWidget {
  const ReadFromExcel({super.key});

  @override
  State<ReadFromExcel> createState() => _ReadFromExcelState();
}

class _ReadFromExcelState extends State<ReadFromExcel> {
  List<List<String>> excelData = [];

  Future<void> _exportExcel() async {
    // Create a new Excel document.
    final xlsio.Workbook workbook = xlsio.Workbook(2);
    //Accessing worksheet via index.
    final xlsio.Worksheet sheet = workbook.worksheets[0];
    final xlsio.Worksheet sheet2 = workbook.worksheets[1];
    //Add Text.
    sheet.getRangeByName('A1').setText('Hello World');
    //Add Number
    sheet.getRangeByName('A2').setText("44");
    //Add DateTime
    sheet.getRangeByName('A3').setText("25-11-2025");
    sheet.getRangeByName('B3').setText("B3 Date");

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

  Future<void> _pickAndReadExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      List<List<String>> rows = [];

      for (var table in excel.tables.keys) {
        ///keys means sheet names
        /// you can loop through all sheets
        log(table); //sheet Name

        ///get all rows in the sheet
        for (var row in excel.tables[table]!.rows) {
          log(row.toString());

          rows.add(row.map((cell) => cell?.value.toString() ?? "").toList());
        }
        break; // only first sheet
      }

      setState(() {
        excelData = rows;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No file selected or file is not valid.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read Excel File")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _exportExcel,
              child: Text("Export Excel"),
            ),
            ElevatedButton(
              onPressed: _pickAndReadExcelFile,
              child: Text("Pick Excel File"),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: excelData.length,
            //     itemBuilder: (context, rowIndex) {
            //       return ListTile(title: Text(excelData[rowIndex].join(" | ")));
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
