// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, duplicate_ignore

// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
void main() {
  runApp(MyApp());
}
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      // imagePath:'assets/chapchap_logo.png',
      
      image: Image.network('https://i1.wp.com/chapchap.co/wp-content/uploads/2020/07/chapchao_logo_200x62.png?fit=272%2C62&ssl=1'),
          // image: AssetImage('assets/chapchap_logo.png'),
      seconds: 6,
      navigateAfterSeconds: SecondScreen(),
      title: Text('Growing your business',textScaleFactor: 2,),
      
      loadingText: Text("Loading"),
      photoSize: 200.0,
      loaderColor: Colors.red,
    );
  }
}
// ignore: use_key_in_widget_constructors
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Profile")),
      body: Center(
        child:Text("Home page",textScaleFactor: 2,)
      ),
    );
  }
}