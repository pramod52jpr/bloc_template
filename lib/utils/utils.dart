import 'package:another_flushbar/flushbar.dart';
import 'package:bloc_template/utils/enum.dart';
import 'package:flutter/material.dart';

class Utils{
  static showFlushBar(String message, FlushBarType flushBarType, BuildContext context){
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: flushBarType == FlushBarType.success ? Colors.green : flushBarType == FlushBarType.error ? Colors.red : Colors.yellow,
      borderRadius: BorderRadius.circular(10),
      icon: Icon(
        flushBarType == FlushBarType.success ?
            Icons.check_circle :
            flushBarType == FlushBarType.error ?
                Icons.error :
            Icons.warning,
          color: Colors.white,
      ),
    ).show(context);
  }
}