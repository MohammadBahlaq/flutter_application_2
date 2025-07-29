import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ConverWidgetToImage extends StatefulWidget {
  const ConverWidgetToImage({super.key});

  @override
  State<ConverWidgetToImage> createState() => _ConverWidgetToImageState();
}

class _ConverWidgetToImageState extends State<ConverWidgetToImage> {
  List<GlobalKey> globalKeys = List.generate(50, (index) => GlobalKey());

  List<String> base64Container = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conver Widget To Image")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          for (var key in globalKeys) {
            base64Container.add(await _captureAndConvert(key) ?? "");
          }

          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       scrollable: true,
          //       content: Image.memory(base64Decode(base64Container)),
          //     );
          //   },
          // );
        },
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder: (context, index) {
          return RepaintBoundary(
            key: globalKeys[index],
            child: Container(
              margin: EdgeInsets.all(10),
              height: 200,
              width: 200,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text("$index"),
            ),
          );
        },
      ),
    );
  }

  Future<String?> _captureAndConvert(GlobalKey globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);

      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        String base64String = base64Encode(pngBytes);
        return base64String;
      }
    } catch (e) {
      print('Error capturing or converting: $e');
    }

    return null;
  }
}
