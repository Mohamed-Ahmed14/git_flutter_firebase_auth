

import 'package:firebase_project/view_model/cubit/auth_cubit/cubit.dart';

abstract class AuthState{}

class AuthInitState extends AuthState{}

class AuthResetControllerState extends AuthState{}

class LoginSuccessState extends AuthState{}
class LoginErrorState extends AuthState{}

class SignUpSuccessState extends AuthState{}

class LogoutSuccessState extends AuthState{}