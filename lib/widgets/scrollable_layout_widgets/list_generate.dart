import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/scrollable_layout_widgets/list_view_widget.dart';

class ListGenerate extends StatelessWidget {
  const ListGenerate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: List.generate(10, (index) => CustomWidget(index: index)),
        ),
      ),
    );
  }
}
