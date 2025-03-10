import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../LoginScreen/view/LoginScreen.dart';
import '../SignUpScreen/view/SignUpScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loginscreen())));
    //Get.toNamed("/Loginscreen"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              // radius: 150,
              child: Image.asset(
                "assets/images/logo.png", height: 70, width: 70,
                // fit: BoxFit.fill,
              ),
            )));
  }
}
