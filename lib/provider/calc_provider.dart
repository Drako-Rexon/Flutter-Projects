import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalcProvider extends ChangeNotifier {
  final compController = TextEditingController();

  setValue(String value) {
    String val = compController.text;
    log(value);
    switch (value) {
      case "C":
        compController.clear();
        break;
      case "AC":
        if (val.length > 0)
          compController.text = val.substring(0, val.length - 1);
        break;
      case "X":
        compController.text += "*";
        break;
      case "=":
        calculate();
        break;
      default:
        compController.text += value;
        break;
    }
  }

  calculate() {
    String txt = compController.text;
    try {
      compController.text = txt.interpret().toString();
    } catch (error) {
      log(error.toString());
      compController.text = "Bad expression";
      Timer(const Duration(seconds: 2), () => compController.clear());
    }
  }

  @override
  void dispose() {
    super.dispose();
    compController.dispose();
  }
}
