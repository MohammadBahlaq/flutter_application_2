import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form widget')),
      body: Column(
        children: [
          // Form(
          //   key: formKey,
          //   child: Column(
          //     children: [
          //       TextFormField(),
          //       TextFormField(),
          //       ElevatedButton(child: Text('Login'), onPressed: () {}),
          //     ],
          //   ),
          // ),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    value ??= '';

                    if (value.isEmpty) {
                      return "please enter username";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    print("onSaved: $newValue");
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    value ??= '';

                    if (value.isEmpty) {
                      return "please enter password";
                    }

                    if (value.length < 8) {
                      return "at least 8 char";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    print("onSaved: $newValue");
                  },
                ),

                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      print('ERROR');
                      return;
                    }

                    formKey.currentState!.save();

                    print('Success');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
