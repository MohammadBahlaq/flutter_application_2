import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //! AppBar's color
        backgroundColor: Colors.orange,
        // backgroundColor: Color(0xffEF4050), //! passing color by HexDecimal
        // backgroundColor: Color.fromARGB(255, 42, 22, 157),//! passing color by ARGB
        // backgroundColor: Color.fromRGBO(255, 42, 22, 0),//! passing color by RGBO
        //! color for all things on the AppBar
        foregroundColor: Colors.white,
        //! You have to pass it to show elevation
        shadowColor: Colors.black,
        //! a little shadow at the bottom of AppBar
        elevation: 5,
        //! The elevation when body start to scroll under AppBar
        scrolledUnderElevation: 20,
        //! you can use it instead on backgroundColor
        // surfaceTintColor: Colors.red,
        //! title on AppBar usually text
        title: Text(
          'Title',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        //! style for the title
        titleTextStyle: TextStyle(color: Colors.blue),
        //! if you want to make the title in the center of AppBar
        centerTitle: true,
        //! leading means the area at the firs of AppBar,
        //! maybe left if the app in English, or right if the app in Arabic
        leading: Icon(Icons.add, color: Colors.black, size: 30),
        //! you can increse the space of leading
        leadingWidth: 100,
        //! any actions you want like notifications, user image, shopping cart and so on...
        actions: [
          Icon(Icons.notifications, size: 24, color: Colors.white),
          Icon(Icons.shopping_cart, size: 24, color: Colors.white),
        ],
        //! If you want to set raduis for appBar
        //? we will explain it next lesson
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),

      //? Don't foucus on it we will explain it later...
      //! I just wrote it to show how [AppBar] will interact
      //! with scrollable body
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(tileColor: Colors.red),
          );
        },
      ),
    );
  }
}
