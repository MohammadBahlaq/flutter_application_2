import 'package:flutter/material.dart';

class CheckBoxListTileWidget extends StatefulWidget {
  const CheckBoxListTileWidget({super.key});

  @override
  State<CheckBoxListTileWidget> createState() => _CheckBoxListTileWidgetState();
}

class _CheckBoxListTileWidgetState extends State<CheckBoxListTileWidget> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CheckBoxListTile widgt')),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox.adaptive(
                value: rememberMe,
                checkColor: Colors.blue,
                fillColor: WidgetStateProperty.fromMap({
                  WidgetState.selected: Colors.red,
                  WidgetState.any: Colors.brown,
                }),
                side: BorderSide(color: Colors.black, width: 3),
                onChanged: (value) {
                  rememberMe = value ?? false;
                  setState(() {});
                },
              ),
              Text("Remember me"),
            ],
          ),
          CheckboxListTile.adaptive(
            value: rememberMe,
            checkColor: Colors.blue,
            fillColor: WidgetStateProperty.fromMap({
              WidgetState.selected: Colors.red,
              WidgetState.any: Colors.brown,
            }),
            side: BorderSide(color: Colors.black, width: 3),
            onChanged: (value) {
              rememberMe = value ?? false;
              setState(() {});
            },
            tileColor: Colors.grey,
            title: Text('Title'),
            subtitle: Text("SubTitle"),
            secondary: Icon(Icons.add),
            controlAffinity: ListTileControlAffinity.leading,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
