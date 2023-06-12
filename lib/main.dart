// main.dart
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:hufs_project/models/model_query.dart';
import 'package:hufs_project/models/model_item_provider.dart';
import 'package:hufs_project/screens/screen_detail.dart';
import 'package:hufs_project/screens/screen_index.dart';
import 'package:hufs_project/screens/screen_search.dart';
import 'package:hufs_project/screens/screen_splash.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => SearchQuery()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '너의 피부를 알려줘',
        routes: {
          '/': (context) => SplashScreen(),
          '/index': (context) => IndexScreen(),
          '/search': (context) => SearchScreen(),
          '/detail': (context) => DetailScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}