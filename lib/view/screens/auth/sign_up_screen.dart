import 'package:firebase_project/view/screens/auth/login_screen.dart';
import 'package:firebase_project/view/screens/home_screen.dart';
import 'package:firebase_project/view_model/cubit/auth_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/auth_cubit/state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
              key: AuthCubit.get(context).formKeySignUp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign Up"),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: AuthCubit.get(context).emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      contentPadding: EdgeInsetsDirectional.all(5),
                      border: OutlineInputBorder(),
                    ),
                    validator:AuthCubit.get(context).validatorOfEmail,

                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: AuthCubit.get(context).passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      contentPadding: EdgeInsetsDirectional.all(5),
                      border: OutlineInputBorder(),
                    ),
                    validator:AuthCubit.get(context).validatorOfPassword,

                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: AuthCubit.get(context).passwordConfirmController,
                    decoration: InputDecoration(
                      hintText: "Confirmation Password",
                      contentPadding: EdgeInsetsDirectional.all(5),
                      border: OutlineInputBorder(),
                    ),
                    validator: AuthCubit.get(context).validatorOfPasswordConfirmation,

                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    if(AuthCubit.get(context).formKeySignUp.currentState!.validate())
                    {
                      AuthCubit.get(context).signUp().then((value){
                        Navigator.pop(context);
                        //Navigator.push(context, MaterialPageRoute(builder:  (context) => LoginScreen(),));
                      });
                    }
                    else
                    {
                      print("Not Valid");
                    }

                  }, child: Text("Sign In")),
                  SizedBox(height: 10,),



                ],
              ),
        ),
      ),
    ));
  }
}
