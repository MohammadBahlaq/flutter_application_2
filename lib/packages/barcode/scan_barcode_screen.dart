import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:short_navigation/short_navigation.dart';

class ScanBarcodeScreen extends StatefulWidget {
  const ScanBarcodeScreen({super.key});

  @override
  State<ScanBarcodeScreen> createState() => _ScanBarcodeScreenState();
}

class _ScanBarcodeScreenState extends State<ScanBarcodeScreen> {
  late MobileScannerController mobileScannerController;

  @override
  void initState() {
    mobileScannerController = MobileScannerController();
    super.initState();
  }

  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan barcode")),
      body: MobileScanner(
        controller: mobileScannerController,
        onDetect: (result) async {
          await mobileScannerController.stop();
          String barcode = result.barcodes.first.rawValue ?? "";
          log("Scanned barcode: $barcode");

          // Navigator.of(context).pop(barcode);

          Go.back(barcode);
        },
      ),
    );
  }
}
