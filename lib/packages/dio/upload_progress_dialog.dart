import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:short_navigation/short_navigation.dart';

class UploadProgressDialog extends StatefulWidget {
  final Stream<double> progressStream;

  const UploadProgressDialog({super.key, required this.progressStream});

  @override
  State<UploadProgressDialog> createState() => _UploadProgressDialogState();
}

class _UploadProgressDialogState extends State<UploadProgressDialog> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    widget.progressStream.listen((value) {
      if (value == -1) {
        Go.back();
        GoMessenger.snackBar(SnackBar(content: Text("Upload failed")));
      } else {
        setState(() => _progress = value);
        log("_progress: $_progress");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Uploading..."),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _progress),
          SizedBox(height: 16),
          Text("${(_progress * 100).toStringAsFixed(0)} %"),
        ],
      ),
    );
  }
}
