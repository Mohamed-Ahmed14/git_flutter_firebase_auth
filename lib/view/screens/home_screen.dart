import 'package:firebase_project/view/screens/auth/login_screen.dart';
import 'package:firebase_project/view_model/cubit/auth_cubit/cubit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            AuthCubit.get(context).logout();
            Navigator.pop(context);
            //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),),(route) => false,);
          }, icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    ));
  }
}
