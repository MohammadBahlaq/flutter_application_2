import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerPackage extends StatelessWidget {
  const PermissionHandlerPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PermissionHandler package')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Request Camera permission'),
              onPressed: () async {
                var x = await Permission.camera.status;
                log(x.toString());

                if (await Permission.camera.isPermanentlyDenied) {
                  PermissionStatus permissionStatus = await Permission.camera
                      .request();
                  log(permissionStatus.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
