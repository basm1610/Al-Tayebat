import 'dart:ui';

import 'package:apppp/MainShellScreen%20.dart';
import 'package:apppp/feature/auth/presentation/pages/forget_password_page.dart';
import 'package:apppp/feature/auth/presentation/pages/login_page.dart';
import 'package:apppp/feature/auth/presentation/pages/register_page.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:apppp/feature/cart/presentation/pages/cartPage.dart';
import 'package:apppp/feature/contact/presentation/pages/contact_page.dart';
import 'package:apppp/feature/foodDetails/presentation/pages/FoodDetailsPage.dart';
import 'package:apppp/feature/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(create: (context)=>CartBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
