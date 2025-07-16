import 'package:flutter/material.dart';

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
              onPressed: () async {},
            ),
          ],
        ),
      ),
    );
  }
}
