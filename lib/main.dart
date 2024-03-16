import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/view/screens/splash/splash_screen.dart';
import 'package:firebase_project/view_model/cubit/auth_cubit/cubit.dart';
import 'package:firebase_project/view_model/data/local/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthCubit(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  ));
}