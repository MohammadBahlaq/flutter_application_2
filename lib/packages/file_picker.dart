import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerPackage extends StatelessWidget {
  const FilePickerPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File picker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Request permission"),
              onPressed: () async {
                // Permission.storage;
                // Permission.manageExternalStorage;

                if (!await Permission.manageExternalStorage.isGranted) {
                  Permission.manageExternalStorage.request();
                }
              },
            ),
            ElevatedButton(
              child: Text("Select file"),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform
                    .pickFiles();

                if (result != null) {
                  PlatformFile file = result.files.first;

                  log(file.name);
                  log(file.bytes.toString());
                  log(file.size.toString());
                  log(file.extension!);
                  log(file.path!);
                  log(file.path!.split("/").last.split(".").first);
                  log(file.path!.split(".").last);
                }
              },
            ),
            ElevatedButton(
              child: Text("Select many files"),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  // type: FileType.image,
                  // allowedExtensions: ['pdf', 'doc'],
                );

                if (result != null) {
                  List<File> files = result.paths
                      .map((path) => File(path!))
                      .toList();

                  for (var element in files) {
                    log(element.path);
                  }
                } else {
                  // User canceled the picker
                }
              },
            ),
            ElevatedButton(
              child: Text("Select directory"),
              onPressed: () async {
                String? path = await FilePicker.platform.getDirectoryPath();

                log(path ?? "");

                if (path != null) {
                  Directory directory = Directory(path);

                  var files = directory.list();
                  files.forEach((element) {
                    log(
                      "File Name : ${element.path.split("/").last.split(".").first}",
                    );
                  });

                  List<File> files2 = directory
                      .listSync()
                      .whereType<File>()
                      .toList();

                  // List list = ["",8,true];
                  // list.whereType<bool>();

                  log("Files: $files");
                }
              },
            ),
            ElevatedButton(
              child: Text("Save File"),
              onPressed: () async {
                File file = File("/storage/emulated/0/Download/file.txt");
                await file.writeAsString("contents");

                String? outputFile = await FilePicker.platform.saveFile(
                  dialogTitle: 'Please select an output file:',
                  fileName: 'test_file',
                  bytes: await file.readAsBytes(),
                );

                if (outputFile == null) {
                  // User canceled the picker
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
