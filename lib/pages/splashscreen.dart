
// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:chapchap_kyc_frontend/pages/startPage.dart';

import 'select_user.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    
          Timer(
            Duration(seconds: 3),
                () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => StartPage())
                )
                );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/chapchap_logo.png',height:150,width: 150,),
            const Text('Grow Your Business',style: TextStyle(color: Colors.red,fontSize:25)),
            const SizedBox(height: 10,),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            )
          ],
        ),
      ),
      
    );
  }
}

 