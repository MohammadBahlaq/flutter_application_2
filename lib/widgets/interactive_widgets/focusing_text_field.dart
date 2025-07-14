import 'package:flutter/material.dart';

class FocusingTextField extends StatefulWidget {
  const FocusingTextField({super.key});

  @override
  State<FocusingTextField> createState() => _FocusingTextFieldState();
}

class _FocusingTextFieldState extends State<FocusingTextField> {
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FocusScope")),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            onChanged: (value) {
              // if (value.length == 1) {
              //   FocusScope.of(context).nextFocus();
              // }
            },
            onEditingComplete: () {
              focusNode.requestFocus();
            },
          ),
          ExcludeFocus(
            child: ElevatedButton(
              onPressed: () {
                FocusScope.of(context).nextFocus();
                // focusNode2.nextFocus();
              },
              child: Text("Next focus"),
            ),
          ),

          SizedBox(height: 30),

          TextFormField(
            // focusNode: focusNode2,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          ExcludeFocus(
            child: ElevatedButton(
              onPressed: () {
                FocusScope.of(context).previousFocus();
              },
              child: Text("Previous focus"),
            ),
          ),

          SizedBox(height: 30),
          TextFormField(
            focusNode: focusNode,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
            },
            child: Text("Unfocus focus"),
          ),
        ],
      ),
    );
  }
}
