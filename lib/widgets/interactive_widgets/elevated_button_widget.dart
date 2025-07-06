// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/interactive_widgets/custom_button.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ElevatedButton widget')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tooltip(
              message: 'Login',
              child: CustomButton(
                onClick: () {
                  print('Login');
                },
                text: 'Login',
                color: Colors.teal,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              onClick: () {
                print('Logout');
              },
              text: 'Logout',
              color: Colors.green,
              foregroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red))
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                elevation: 15,
                shadowColor: Colors.blue,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                fixedSize: Size(200, 60),
                // fixedSize: Size.fromWidth(200),
                // fixedSize: Size.fromHeight(50),
                // minimumSize: Size(100, 50),
                // maximumSize: Size(200, 70),
                // padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                disabledBackgroundColor: Colors.black,
                disabledForegroundColor: Colors.white,
              ),
              onPressed: true
                  ? () {
                      print('onPressed');
                    }
                  : null,
              // onLongPress: () {
              //   print('onLongPress');
              // },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              // style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red))
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                elevation: 15,
                shadowColor: Colors.blue,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                fixedSize: Size(200, 60),
                // fixedSize: Size.fromWidth(200),
                // fixedSize: Size.fromHeight(50),
                // minimumSize: Size(100, 50),
                // maximumSize: Size(200, 70),
                // padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                disabledBackgroundColor: Colors.black,
                disabledForegroundColor: Colors.white,
              ),
              onPressed: true
                  ? () {
                      print('onPressed');
                    }
                  : null,
              // onLongPress: () {
              //   print('onLongPress');
              // },
              label: Text('Login'),
              icon: Icon(Icons.login),
            ),
          ],
        ),
      ),
    );
  }
}
