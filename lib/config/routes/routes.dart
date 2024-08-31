import 'package:bloc_template/config/routes/routes_name.dart';
import 'package:bloc_template/views/view.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen :
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.loginScreen :
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No route generated"),
            ),
          );
        },);
    }
  }
}