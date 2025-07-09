import 'dart:developer';

import 'package:flutter/material.dart';

class TextFiledWidget extends StatefulWidget {
  const TextFiledWidget({super.key});

  @override
  State<TextFiledWidget> createState() => _TextFiledWidgetState();
}

class _TextFiledWidgetState extends State<TextFiledWidget> {
  late TextEditingController textEditingController;
  late int counter;

  @override
  void initState() {
    textEditingController = TextEditingController(text: 'Mohammad Bahlaq');
    counter = 0;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField widget')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          // key: UniqueKey(),
          cursorColor: Colors.red,
          autofocus: false,
          enabled: true,
          keyboardType: TextInputType.number,
          controller: textEditingController,
          readOnly: false,
          obscureText: false,
          inputFormatters: [
            // FilteringTextInputFormatter.digitsOnly,
            // LengthLimitingTextInputFormatter(10),
            // FilteringTextInputFormatter.deny(RegExp('[A-Z]')),
            // FilteringTextInputFormatter.allow(RegExp('[A-Z]')),
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade900),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            // prefix: Icon(Icons.email, color: Colors.black),
            // suffix: Icon(Icons.check, color: Colors.black),
            prefixIcon: Icon(Icons.password),
            suffixIcon: Icon(Icons.visibility),
            // prefixText: 'prefixText',
            // hint: Text("Password",style: TextStyle()),
            // hintText: "Password",
            // hintStyle: TextStyle(),
            // label: Text("Password", style: TextStyle()),
            // labelText: "Password",
            // labelStyle: TextStyle(),
          ),
          onChanged: (text) {
            // prnt("onChanged: $text");
          },
          onTap: () {
            log(textEditingController.text);

            textEditingController.selection = TextSelection(
              baseOffset: 0,
              extentOffset: textEditingController.text.length,
            );
          },
          onTapOutside: (event) {
            textEditingController.clear();
            // print("onTapOutside");
          },
          onEditingComplete: () {
            // print("onEditingComplete");
          },
          onFieldSubmitted: (value) {
            // print("onFieldSubmitted: $value");
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (text) {
            text ??= '';

            if (text.isEmpty) {
              return 'Please fill information';
            }
            if (text.length < 8) {
              return 'at lest 8 char';
            }

            return null;
          },
        ),
      ),
    );
  }
}
