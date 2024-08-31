import 'dart:async';

import 'package:bloc_template/config/routes/routes_name.dart';
import 'package:bloc_template/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';

class SplashServices{
  void isLogin(BuildContext context){
    SessionController().getUserFromPreference().then((value) {
      if(SessionController().isLogin == true){
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false);
        },);
      }else{
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false);
        },);
      }
    }).onError((error, stackTrace) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false);
      },);
    });

  }
}