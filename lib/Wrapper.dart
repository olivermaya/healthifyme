import 'dart:async';

import 'package:bmi_calculator/auth_screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'Tabbar/tabbar.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
   @override
  void initState() {
    super.initState();
    // Check if user is already logged in
     
   
      // Check if user is already logged in
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          // Navigate to home page if user is logged in
          Get.offAll(() => Tabbarr());
        } else {
          
          // Navigate to login page if user is not logged in
          Get.offAll(() =>  LoginScreen());
        }
      }
      
      );
   
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}