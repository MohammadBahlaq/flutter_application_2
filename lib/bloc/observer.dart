import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class Observer implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log("onChange ${bloc.state}");
  }

  @override
  void onClose(BlocBase bloc) {
    log("onClose");
  }

  @override
  void onCreate(BlocBase bloc) {
    log("onCreate ${bloc.state}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("onError");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log("onEvent");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("onTransitions");
  }
}
