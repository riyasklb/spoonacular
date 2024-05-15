import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin AppConstants {
  static void disposeKeyboard() {
    return FocusManager.instance.primaryFocus?.unfocus();
  }
}
