import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/core/responsive.dart';
import 'package:flutter_application_2/widgets/scrollable_layout_widgets/list_view_widget.dart';

class MediaqueryClass extends StatefulWidget {
  const MediaqueryClass({super.key});

  @override
  State<MediaqueryClass> createState() => _MediaqueryClassState();
}

class _MediaqueryClassState extends State<MediaqueryClass> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.red,
        systemNavigationBarColor: Colors.blue,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeLeft,
    // ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log(MediaQuery.of(context).size.width.toString());
    // log(MediaQuery.of(context).size.height.toString());
    // log(MediaQuery.of(context).orientation.toString());
    // log(MediaQuery.of(context).padding.top.toString());
    // log(MediaQuery.of(context).viewInsets.bottom.toString());

    log(MediaQuery.sizeOf(context).width.toString());
    log(MediaQuery.sizeOf(context).height.toString());
    log(MediaQuery.orientationOf(context).toString());
    log(MediaQuery.paddingOf(context).top.toString());
    log(MediaQuery.viewInsetsOf(context).bottom.toString());

    // final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('MediaQuery')),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(color: Colors.red, height: size.height * 0.5),
              TextField(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(context.w(330), context.h(48)),
                  backgroundColor: Color(0xff25AE4B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text("Add To Cart"),
              ),
              Text("Add To Cart", style: TextStyle(fontSize: context.fs(14))),
              // Spacer(),
              SizedBox(height: 600),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              CustomWidget(index: 0),
            ],
          ),
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       TextField(),
        //       GestureDetector(
        //         onTap: () {
        //MediaQuery.sizeOf(context).height
        //MediaQuery.sizeOf(context).width
        //MediaQuery.orientationOf(context)
        //MediaQuery.paddingOf(context).top
        //MediaQuery.viewInsetsOf(context).bottom
        //         },
        //         child: Container(
        //           height: context.h(57),
        //           width: context.w(366),
        //           decoration: BoxDecoration(
        //             color: Colors.green,
        //             borderRadius: BorderRadius.circular(7),
        //           ),
        //           alignment: Alignment.center,
        //           child: Text('Click', style: TextStyle(color: Colors.white)),
        //         ),
        //       ),
        //       // Spacer(),
        //       SizedBox(height: 500),
        //       CustomWidget(index: 0),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
