import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<DropdownMenuEntry> list = const [
    DropdownMenuEntry(value: 'Jordan value', label: 'Jordan'),
    DropdownMenuEntry(value: 'Emarate value', label: 'Emarate'),
    DropdownMenuEntry(value: 'Saudi value', label: 'Saudi'),
    DropdownMenuEntry(value: 'Qwet value', label: 'Qwet'),
    DropdownMenuEntry(value: 'USA value', label: 'USA'),
    DropdownMenuEntry(value: 'Iran value', label: 'Iran'),
    DropdownMenuEntry(value: 'Suria value', label: 'Suria'),
    DropdownMenuEntry(value: 'Egypt value', label: 'Egypt'),
    DropdownMenuEntry(value: 'Tunis value', label: 'Tunis'),
    DropdownMenuEntry(value: 'Pelestaine value', label: 'Pelestaine'),
    DropdownMenuEntry(value: 'Yemen value', label: 'Yemen'),
    DropdownMenuEntry(value: 'Iraq value', label: 'Iraq'),
    DropdownMenuEntry(value: 'Kinda value', label: 'Kinda'),
    DropdownMenuEntry(value: 'UK value', label: 'UK'),
    // DropdownMenuEntry(
    //   value: "JOD",
    //   label: "Jordan",
    //   enabled: true,
    //   leadingIcon: Icon(Icons.flag),
    //   trailingIcon: Icon(Icons.abc),
    //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
    // ),
  ];

  String image = '';

  @override
  void initState() {
    Map map = {};

    map.forEach((key, value) {
      list.add(DropdownMenuEntry(value: value, label: key));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Dropdown widget')),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            // if (image.isNotEmpty) Image.asset(image),
            Center(
              child: DropdownMenu(
                dropdownMenuEntries: list,
                menuHeight: 300,
                width: 300,
                label: Text('Country'),
                hintText: 'Select country',
                requestFocusOnTap: true,
                enableSearch: true,
                enableFilter: true,
                enabled: true,
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(RegExp('[a-z]')),
                // ],
                keyboardType: TextInputType.name,
                leadingIcon: Icon(Icons.flag),
                trailingIcon: Icon(Icons.add),
                selectedTrailingIcon: Icon(Icons.remove),
                textStyle: TextStyle(color: Colors.green),
                menuStyle: MenuStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  // backgroundColor: WidgetStateProperty.fromMap({
                  //   WidgetState.disabled: Colors.black,
                  //   WidgetState.focused: Colors.red,
                  //   WidgetState.pressed: Colors.blue,
                  //   WidgetState.any: Colors.red,
                  // }),
                  shadowColor: WidgetStatePropertyAll(Colors.blue),
                  elevation: WidgetStatePropertyAll(50),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                onSelected: (value) {
                  image = value!;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
