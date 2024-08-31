import 'package:bloc_template/config/components/app_button.dart';
import 'package:bloc_template/config/components/internat_exception_widget.dart';
import 'package:bloc_template/config/components/loading_widget.dart';
import 'package:bloc_template/services/splash/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("splash screen"),
        ),
      ),
    );
  }
}
