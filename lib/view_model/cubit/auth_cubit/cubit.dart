

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/view_model/cubit/auth_cubit/state.dart';
import 'package:firebase_project/view_model/data/local/shared_helper.dart';
import 'package:firebase_project/view_model/data/local/shared_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super(AuthInitState());


  static AuthCubit get(context)=>BlocProvider.of<AuthCubit>(context);



  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();

   bool loginSuccessfully = false;

  String? userId;

  String? validatorOfEmail(String? value){
    if(value!.isEmpty)
      return "Please Enter Your Email";
    return null;

  }

  String? validatorOfPassword(String? value){
    if(passwordController.text.isEmpty)
      return "Please Enter Your Password";
    return null;

  }

  String? validatorOfPasswordConfirmation(String? value){
    if((value!.isEmpty) || (value.toString() != passwordController.text))
      return "Please Enter Confirmed Password";
    return null;

  }


  Future<void> login() async{
    print("login ${emailController.text}");
    print("login ${passwordController.text}");
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
      print(value.user?.email);
      print(value.user?.uid);
      //userId=value.user!.uid;
      emit(LoginSuccessState());
    },).catchError((error){
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  Future<void> signUp() async{
    print(emailController.text);
    print(passwordController.text);
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
      print(value.user?.uid);
      //SharedHelper.set(key: SharedKeys.uid, value: value.user?.uid);
      emit(SignUpSuccessState());
    },).catchError((error){
      print(error.toString());
    });
  }

  Future<void> logout() async{
    FirebaseAuth.instance.signOut();
    emit(LogoutSuccessState());
  }

  void reset(){
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    userId="";
    emit(AuthResetControllerState());
  }

}