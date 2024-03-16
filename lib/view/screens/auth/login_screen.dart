import 'package:firebase_project/view/screens/auth/sign_up_screen.dart';
import 'package:firebase_project/view/screens/home_screen.dart';
import 'package:firebase_project/view_model/cubit/auth_cubit/cubit.dart';
import 'package:firebase_project/view_model/data/local/shared_helper.dart';
import 'package:firebase_project/view_model/data/local/shared_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/cubit/auth_cubit/state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Login"),
            BlocConsumer<AuthCubit,AuthState>(
              listener: (context, state) {
                if(state is LoginSuccessState)
                  {
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => HomeScreen(),));
                  }
                else if(state is LoginErrorState){
                  print("Can't login");
                }
              },
              builder: (context, state) {
                var cubit = AuthCubit.get(context);
                return Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 20,),
                      TextFormField(
                        controller: AuthCubit.get(context).emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          contentPadding: EdgeInsetsDirectional.all(5),
                          border: OutlineInputBorder(),
                        ),
                        validator:AuthCubit.get(context).validatorOfEmail,
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: AuthCubit.get(context).passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          contentPadding: EdgeInsetsDirectional.all(5),
                          border: OutlineInputBorder(),
                        ),
                        validator:AuthCubit.get(context).validatorOfPassword,
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){
                        if(cubit.formKey.currentState!.validate())
                        {
                          AuthCubit.get(context).login().then((value){
                            //print("key firebase ${AuthCubit.get(context).userId}");
                           // print("key cache ${SharedHelper.get(key: SharedKeys.uid)}");
                            //if(AuthCubit.get(context).userId == SharedHelper.get(key: SharedKeys.uid))
                            //{
                              print("Nice!!!!!!!!");
                              //AuthCubit.get(context).reset();

                            //}
                          });
                        }else
                        {
                          print("not valid");
                        }

                      }, child: Text("Login")),
                      Row(
                        children: [
                          Text("Don't have account?"),
                          SizedBox(width: 10,),
                          TextButton(onPressed: (){
                            AuthCubit.get(context).reset();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                          }, child:Text("Sign Up"))
                        ],
                      ),


                    ],
                  ),
                );
              },
            ),
          ],
        ),
      )
    ));
  }
}
