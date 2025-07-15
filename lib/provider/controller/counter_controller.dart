import 'package:flutter/widgets.dart';

class CounterController with ChangeNotifier {
  int counter = 0;
  int counter2 = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void increment2() {
    counter2++;
    notifyListeners();
  }
}
