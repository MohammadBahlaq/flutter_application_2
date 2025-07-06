import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color = Colors.red,
    this.foregroundColor,
    required this.onClick,
    required this.text,
  });

  final Color color;
  final Color? foregroundColor;
  final String text;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        elevation: 15,
        shadowColor: Colors.blue,
        backgroundColor: color,
        foregroundColor: foregroundColor,
        fixedSize: Size(200, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        disabledBackgroundColor: Colors.black,
        disabledForegroundColor: Colors.white,
      ),
      onPressed: onClick,
      child: Text(text),
    );
  }
}
