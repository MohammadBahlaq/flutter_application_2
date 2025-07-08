import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/scrollable_layout_widgets/list_view_widget.dart';

class ShowMethods extends StatelessWidget {
  const ShowMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Show methods')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Show Dialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: Colors.black.withAlpha(100),
                  builder: (context) {
                    return AlertDialog.adaptive(
                      // scrollable: true,
                      icon: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Icon(Icons.close),
                      ),
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Warning'),
                      ),
                      backgroundColor: Colors.white,
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actionsPadding: EdgeInsets.all(15),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Chancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text('Ok'),
                        ),
                      ],
                      alignment: AlignmentDirectional.centerStart,
                      // content:Text('data'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('data'), Text('data')],
                      ),
                      // content: Column(
                      //   children: List.generate(
                      //     10,
                      //     (index) => CustomWidget(index: index),
                      //   ),
                      // ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Bottom Sheet'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.blue,
                  isDismissible: true,
                  barrierColor: Colors.black.withAlpha(100),
                  showDragHandle: true,
                  // constraints: BoxConstraints(maxHeight: 300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (context) {
                    return DraggableScrollableSheet(
                      maxChildSize: 1,
                      minChildSize: 0.5,
                      expand: false,
                      initialChildSize: 0.6,
                      builder: (context, scrollController) {
                        return ListView.separated(
                          controller: scrollController,
                          padding: EdgeInsets.only(
                            top: 20,
                            right: 20,
                            left: 20,
                          ),
                          itemCount: 15,
                          separatorBuilder: (_, index) => SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            return CustomWidget(index: index);
                          },
                        );
                      },
                    );
                    // return Column(
                    //   crossAxisAlignment: CrossAxisAlignment.stretch,
                    //   children: [Text("data"), Text("data"), Text("data")],
                    // );
                  },
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Show snackBar'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login Success'),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.green,
                    // padding: EdgeInsets.all(30),
                    showCloseIcon: true,
                    closeIconColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    // width: 300,
                    shape: StadiumBorder(),
                    elevation: 0,
                    margin: EdgeInsets.all(50),
                    action: SnackBarAction(
                      label: "label",
                      onPressed: () {
                        print("Label Action");
                        //! Your Action + pop (hide)
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                    onVisible: () {
                      print("onVisible");
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Show materialBanner'),
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: Text('Login Success'),
                    backgroundColor: Colors.red,
                    dividerColor: Colors.black,
                    onVisible: () {
                      print("onVisible");
                    },
                    leading: Icon(Icons.login),
                    margin: EdgeInsets.all(20),
                    elevation: 50,
                    shadowColor: Colors.blue,
                    minActionBarHeight: 100,
                    padding: EdgeInsets.all(20),
                    actions: [
                      IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(
                            context,
                          ).hideCurrentMaterialBanner();
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Show TimePicker'),
              onPressed: () async {
                TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 00, minute: 00),
                  initialEntryMode: TimePickerEntryMode.dial,
                  helpText: 'Please Select time',
                  // builder: (context, child) {
                  //   return Theme(
                  //     data: Theme.of(context).copyWith(
                  //       colorScheme: ColorScheme.light(
                  //         onPrimary: Colors.red,
                  //         onSurface: Colors.purple,
                  //       ),
                  //       timePickerTheme: TimePickerThemeData(
                  //         backgroundColor: Colors.white,
                  //         dialBackgroundColor: Colors.grey,
                  //         dialHandColor: Colors.green,
                  //         // dialTextStyle: TextStyle(color: Colors.red),
                  //         // dialTextColor: Colors.purple,
                  //         helpTextStyle: TextStyle(color: Colors.red),
                  //         cancelButtonStyle: TextButton.styleFrom(
                  //           foregroundColor: Colors.purple,
                  //         ),
                  //         confirmButtonStyle: TextButton.styleFrom(
                  //           foregroundColor: Colors.purple,
                  //         ),
                  //         hourMinuteColor: Colors.blue,
                  //         hourMinuteTextColor: Colors.white,
                  //         entryModeIconColor: Colors.amber,
                  //         dayPeriodColor: Colors.yellow,
                  //         dayPeriodTextStyle: TextStyle(color: Colors.brown),
                  //       ),
                  //     ),
                  //     child: child!,
                  //   );
                  // },
                );

                if (timeOfDay != null) {
                  print(timeOfDay.toString());
                }
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Show DatePicker'),
              onPressed: () async {
                DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 3)),
                  lastDate: DateTime.now().add(Duration(days: 3)),
                  initialDatePickerMode: DatePickerMode.day,
                  helpText: 'Please Select time',
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.red,
                          onPrimary: Colors.blue,
                          onSurface: Colors.green,
                        ),
                        datePickerTheme: DatePickerThemeData(),
                      ),
                      child: child!,
                    );
                  },
                );

                if (dateTime != null) {
                  print(dateTime.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
