// screen_index.dart
import 'package:flutter/material.dart';
import 'package:hufs_project/tabs/tab_home.dart';
import 'package:hufs_project/tabs/tab_profile.dart';
import 'package:hufs_project/tabs/tab_camera.dart';
import 'package:hufs_project/tabs/tab_like.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    HomeTab(),
    ProfileTab(),
    LikeTab(),
    CameraTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff92a7d2),
        title: Text('내 피부를 부탁해'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
            icon: Icon(Icons.search_rounded),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: Color(0xfff6cbca),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '저장'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: '카메라'),
        ],
      ),
        body: _tabs[_currentIndex],
    );
  }
}