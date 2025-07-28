import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth extends StatelessWidget {
  const LocalAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Auth")),
      body: Center(
        child: IconButton(
          onPressed: () async {
            final LocalAuthentication auth = LocalAuthentication();

            if (await auth.canCheckBiometrics) {
              final bool didAuthenticate = await auth.authenticate(
                localizedReason: 'Please authenticate to show account balance',
              );
              log(didAuthenticate.toString());
            }
          },
          icon: Icon(Icons.fingerprint, size: 50),
        ),
      ),
    );
  }
}
