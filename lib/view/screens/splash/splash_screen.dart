import 'package:firebase_project/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),),(route) => false,);
    });
    return SafeArea(child: Scaffold(
      body: Center(child: Text("Welcome ...")),
    ));
  }
}
