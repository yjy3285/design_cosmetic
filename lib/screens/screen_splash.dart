// screen_splash.dart
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void moveScreen() async {
    Navigator.of(context).pushReplacementNamed('/index');
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 5000), () {
      moveScreen();
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/hufs-fc8d8.appspot.com/o/cosmetic%2F%E1%84%89%E1%85%B5%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%92%E1%85%AA%E1%84%86%E1%85%A7%E1%86%AB.jpg?alt=media&token=20a982ba-218d-418a-aac2-b848f18f4791'),
              fit: BoxFit.fitHeight
          )
        ),
      ),
    );
  }
}