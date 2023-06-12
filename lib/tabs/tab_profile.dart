// tab_profile.dart
import 'package:flutter/material.dart';
import 'package:hufs_project/screens/screen_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstPage(),
              ),
            );},
          child: Text('Your_skin_pick'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15.0),
            textStyle: TextStyle(fontSize: 40, color: Colors.white),
            minimumSize: Size(350, 125),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            backgroundColor: Color(0xfff6cbca),
          ),
        ),
      ),
    );
  }
}