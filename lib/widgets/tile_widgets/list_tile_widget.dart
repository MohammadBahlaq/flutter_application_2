import 'package:flutter/material.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({super.key});

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListTile widget')),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (_, index) => SizedBox(height: 10),
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.grey,
            title: Text('Title'),
            subtitle: Text("SubTitle"),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.add),
            contentPadding: EdgeInsets.all(15),
            splashColor: Colors.blue,
            selected: selectedIndex == index,
            selectedColor: Colors.white,
            selectedTileColor: Colors.red,
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
          );
        },
      ),
    );
  }
}
