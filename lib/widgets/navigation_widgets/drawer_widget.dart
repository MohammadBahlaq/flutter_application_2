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

      drawerEnableOpenDragGesture: false,

      // drawerDragStartBehavior: DragStartBehavior.down,
      //Foucus text
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

      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         duration: Duration(seconds: 1),
      //         curve: Curves.linear,
      //         margin: EdgeInsets.all(10),
      //         padding: EdgeInsets.all(15),
      //         decoration: BoxDecoration(
      //           color: Colors.green,
      //           border: Border.all(color: Colors.black, width: 2),
      //         ),
      //         child: CircleAvatar(
      //           radius: 200,
      //           backgroundImage: AssetImage(AppImages.garden),
      //         ),
      //       ),
      //       ListTile(
      //         onTap: () {
      //           Navigator.of(context).pop();
      //         },
      //         leading: Icon(Icons.home),
      //         trailing: Icon(Icons.arrow_forward_ios_rounded),
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         title: Text("Home", style: TextStyle(color: Colors.white)),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.person),
      //         trailing: Icon(Icons.arrow_forward_ios_rounded),
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         title: Text("Profile", style: TextStyle(color: Colors.white)),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.favorite),
      //         trailing: Icon(Icons.arrow_forward_ios_rounded),
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         title: Text("Favorite", style: TextStyle(color: Colors.white)),
      //       ),
      //     ],
      //   ),
      // ),
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
