import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerExample extends StatefulWidget {
  const FilePickerExample({super.key});

  @override
  State<FilePickerExample> createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FilePickerExample> {
  int filesCounts = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File Picker Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$filesCounts", style: TextStyle(fontSize: 50)),
            ElevatedButton(
              onPressed: () => _selectFile(),
              child: Text("Select directory"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectFile() async {
    Permission manageExternalStorage = Permission.manageExternalStorage;

    bool status = await manageExternalStorage.isGranted;
    if (!status) {
      await manageExternalStorage.request();
      return;
    }

    String? path = await FilePicker.platform.getDirectoryPath();

    log(path ?? "");

    if (path != null) {
      Directory directory = Directory(path);

      var files = directory.list();
      files.forEach((element) {
        // log("File Name : ${element.path.split("/").last.split(".").first}");
      });

      List<File> files2 = directory.listSync().whereType<File>().toList();

      log(files2.toSet().length.toString());

      filesCounts = files2.toSet().length;
      setState(() {});

      // List list = ["",8,true];
      // list.whereType<bool>();

      // log("Files: $files");
    }
  }
}
