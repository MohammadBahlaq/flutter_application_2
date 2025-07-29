import 'dart:developer';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/packages/barcode/scan_barcode_screen.dart';
import 'package:short_navigation/short_navigation.dart';

class BarcodeWidgetPackage extends StatelessWidget {
  const BarcodeWidgetPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Barcode widget package")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeWidget(
              barcode: Barcode.code128(),
              height: 100,
              // backgroundColor: Colors.red,
              // color: Colors.blue,
              data: 'https://pub.dev/packages/barcode_widget',
              drawText: false,
            ),
            IconButton(
              onPressed: () async {
                String? barcode = await Go.to(ScanBarcodeScreen());

                // String? barcode = await Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => ScanBarcodeScreen()),
                // );

                log("Barcode: $barcode");
              },
              icon: Icon(Icons.qr_code, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
