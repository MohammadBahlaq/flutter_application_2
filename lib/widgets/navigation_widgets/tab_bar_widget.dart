import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      // animationDuration: Duration(seconds: 2),
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBar widget"),
          // bottom: common place for [TabBar],
        ),
        body: Column(
          children: [
            Text("data"),
            Container(height: 300, color: Colors.red),
            TabBar(
              isScrollable: false,
              physics: BouncingScrollPhysics(),
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.orange,
              indicatorWeight: 4,
              // indicator: BoxDecoration(color: Colors.green),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.black,
              dividerHeight: 5,
              splashBorderRadius: BorderRadius.circular(15),
              onTap: (value) {
                print(value);
              },
              tabs: [
                Tab(
                  // height: 100,
                  text: "Home",
                  icon: Icon(Icons.home),
                  //  child: Text("Home")
                  // iconMargin: EdgeInsets.all(15),
                ),
                Tab(text: "Profile", icon: Icon(Icons.person)),
                Tab(text: "Favorite", icon: Icon(Icons.favorite)),
                // Tab(child: Text("Favorite")),
                // Tab(child: Text("Favorite")),
                // Tab(child: Text("Favorite")),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(color: Colors.red),
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
