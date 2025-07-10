import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomNavigationBar widget")),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.red,
            elevation: 0,
            selectedItemColor: Colors.white,
            // selectedLabelStyle: TextStyle(fontSize: 20),
            // selectedFontSize: 20,
            unselectedItemColor: Colors.tealAccent,
            // unselectedLabelStyle: TextStyle(fontSize: 10),
            // unselectedFontSize: 10,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                activeIcon: Icon(Icons.person_2_outlined),
                backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                activeIcon: Icon(Icons.home_outlined),
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
                activeIcon: Icon(Icons.favorite_border),
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
      body: body(),
    );

    //         showSelectedLabels: false,
    //         showUnselectedLabels: false
  }

  // Widget _body() {
  //   switch (selectedIndex) {
  //     case 0:
  //       return PageOne();
  //     case 1:
  //       return PageTwo();
  //     case 2:
  //       return PageThree();
  //     default:
  //       return SizedBox();
  //   }
  // }

  Widget body() {
    switch (selectedIndex) {
      case 0:
        return Center(child: Text('Profile', style: TextStyle(fontSize: 30)));
      case 1:
        return Center(child: Text('Home', style: TextStyle(fontSize: 30)));
      case 2:
        return Center(child: Text('Favorite', style: TextStyle(fontSize: 30)));
      default:
        return SizedBox();
    }
  }
}
