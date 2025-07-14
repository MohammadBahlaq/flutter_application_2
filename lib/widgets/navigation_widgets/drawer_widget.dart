import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/app_images.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Drawer widget"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        // leading: Icon(Icons.add),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
            scaffoldKey.currentState!.closeDrawer();
          },
          icon: Icon(Icons.open_in_new_sharp),
        ),
      ),

      drawerScrimColor: Colors.red,
      drawerEdgeDragWidth: 100,

      onDrawerChanged: (isOpened) {
        print(isOpened);
      },
      onEndDrawerChanged: (isOpened) {},

      drawerEnableOpenDragGesture: true,

      drawerDragStartBehavior: DragStartBehavior.down,

      drawer: Drawer(
        backgroundColor: Colors.blue,
        elevation: 50,
        shadowColor: Colors.red,
        width: 250,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.horizontal(
            end: Radius.circular(30),
          ),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              duration: Duration(seconds: 2),
              curve: Curves.linear,
              child: Image.asset(AppImages.garden),
            ),
            MyDrawerItem(icon: Icons.home, text: "Home"),
            MyDrawerItem(icon: Icons.person, text: "Profile"),
            MyDrawerItem(icon: Icons.favorite, text: "Favorite"),
          ],
        ),
      ),
    );
  }
}

class MyDrawerItem extends StatelessWidget {
  const MyDrawerItem({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text("data")),
        );
      },
      title: Text(text),
      leading: Icon(icon),
      iconColor: Colors.white,
      textColor: Colors.white,
    );
  }
}
