import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/tile_widgets/switch_list_tile_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: SwitchListTileWidget(),
    );
  }
}
