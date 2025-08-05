import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/packages/dio/upload_progress_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:short_navigation/short_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? selectedImage;
  String imageUrlAfterUplaod = '';
  double prcnt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageUrlAfterUplaod.isNotEmpty)
              Image.network(imageUrlAfterUplaod),
            ElevatedButton(
              onPressed: () => _pickImage(),
              child: Text("select Image"),
            ),
            ElevatedButton(
              onPressed: () => _uploadImage(),
              child: Text("Upload Image"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(source: ImageSource.camera);

    if (file != null) {
      selectedImage = File(file.path);
    }
  }

  Future<void> _uploadImage() async {
    if (selectedImage == null) return;

    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(selectedImage!.path),
    });

    // Show Dialog with progress
    GoMessenger.dialog(
      barrierDismissible: false,
      UploadProgressDialog(progressStream: _uploadFile(dio, formData)),
    );
  }

  // Function returns Stream<double> to update the dialog
  Stream<double> _uploadFile(Dio dio, FormData formData) {
    StreamController<double> controller = StreamController<double>();

    try {
      dio
          .post(
            "https://api.escuelajs.co/api/v1/files/upload",

            ///body
            data: formData,
            onSendProgress: (count, total) {
              prcnt = count / total;
              log("prcnt: $prcnt");
              controller.add(prcnt);
            },
          )
          .then((response) {
            Go.back();
            log("response: $response");
            imageUrlAfterUplaod = response.data['location'];
            setState(() {});
            controller.add(1);
            controller.close();
          });

      // Complete
    } catch (e) {
      log(e.toString());
      controller.add(-1);
    }
    return controller.stream;
  }
}
