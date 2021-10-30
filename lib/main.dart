// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';


void main(){
  runApp(Splash());
}

// ignore: use_key_in_widget_constructors
class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  BuildContext? get context => null;
 @override
// ignore: override_on_non_overriding_member
void initState(){
  //  super.initState();
   Timer(Duration(seconds:3),(){
     Navigator.of(context!).
     pushReplacement(MaterialPageRoute(builder: (_)=>Homepage()));
   });
 }
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/chapchap-logo.png',height:200,width: 200,),
            // SizedBox(height: 10,),
            Text('Grow Your Business',style: TextStyle(color: Colors.red,fontSize:25)),
            SizedBox(height: 10,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            )
          ],
        ),
      ),
      
    );
  }
}

 class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.red[200],
        title: Text('Profiles'),
      ),
      body: Center(
        child:Text('Home sweet home')
      ),
    );
  }
}
