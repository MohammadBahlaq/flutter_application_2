import 'package:flutter/material.dart';

class MyTabControllerExample extends StatefulWidget {
  const MyTabControllerExample({super.key});

  @override
  State<MyTabControllerExample> createState() => _MyTabControllerExampleState();
}

class _MyTabControllerExampleState extends State<MyTabControllerExample>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1,
      animationDuration: Duration(seconds: 1),
    );

    tabController.addListener(() {
      print(tabController.index);
      print(tabController.previousIndex);
      print(tabController.offset);
    });

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tabController.animateTo(
          2,
          duration: Duration(seconds: 1),
          curve: Curves.easeInBack,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBarController Example'),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.star), text: "Favorites"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            Center(child: Text("Home Page")),
            Center(child: Text("Favorites Page")),
            Center(child: Text("Settings Page")),
          ],
        ),
      ),
    );
  }
}
