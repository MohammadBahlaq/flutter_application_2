import 'package:flutter/material.dart';

class SwitchListTileWidget extends StatefulWidget {
  const SwitchListTileWidget({super.key});

  @override
  State<SwitchListTileWidget> createState() => _SwitchListTileWidgetState();
}

class _SwitchListTileWidgetState extends State<SwitchListTileWidget> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SwitchListTile widgt')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Switch.adaptive(
            value: rememberMe,
            activeColor: Colors.red,
            inactiveThumbColor: Colors.black,
            activeTrackColor: Colors.brown,
            inactiveTrackColor: Colors.blue,
            trackOutlineColor: WidgetStateProperty.fromMap({
              WidgetState.selected: Colors.black,
              WidgetState.any: Colors.red,
            }),
            onChanged: (value) {
              rememberMe = value;
              setState(() {});
            },
          ),
          Text("value: $rememberMe"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile.adaptive(
              value: rememberMe,
              activeColor: Colors.red,
              inactiveThumbColor: Colors.black,
              activeTrackColor: Colors.brown,
              inactiveTrackColor: Colors.blue,
              trackOutlineColor: WidgetStateProperty.fromMap({
                WidgetState.selected: Colors.black,
                WidgetState.any: Colors.red,
              }),
              onChanged: (value) {
                rememberMe = value;
                setState(() {});
              },
              tileColor: Colors.grey,
              title: Text("Title"),
              subtitle: Text("SubTitle"),
              controlAffinity: ListTileControlAffinity.platform,
              secondary: Icon(Icons.add),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(width: 2, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
