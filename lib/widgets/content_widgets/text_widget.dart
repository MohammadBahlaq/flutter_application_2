import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text widget')),
      //! [Center] widget to anything in the center of it's parent
      body: Center(
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          // height: 20,
          child: Text(
            //! text that you want to show
            // 'Text Text Text Text Text Text2 Text2 Text2 Text2',
            '50\$',
            //!text alignment in the parent
            //! [TextAlign.justify] to fill the rest line
            //! by adding spaces between words
            textAlign: TextAlign.justify,
            //! maximum lines for the text
            maxLines: 1,
            //! text behaviour if the text overflow or need more than [maxLines]
            overflow: TextOverflow.visible,
            style: TextStyle(
              // letterSpacing: 4,
              // wordSpacing: 0,
              backgroundColor: Colors.yellow,
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.blue,
              decorationThickness: 2,
            ),
          ),
        ),
      ),
    );
  }
}
