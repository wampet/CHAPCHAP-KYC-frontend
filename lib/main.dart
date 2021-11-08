
import 'package:chapchap_kyc_frontend/pages/cards_page.dart';
import 'package:chapchap_kyc_frontend/pages/final_page.dart';
import 'package:chapchap_kyc_frontend/pages/selfie.dart';
import 'package:chapchap_kyc_frontend/pages/splashscreen.dart';
import 'package:flutter/material.dart';


void main ()=> runApp(MaterialApp(
initialRoute: '/selfieUpload',
routes: {
'/selfieUpload': (context)=> const SelfieUpload(),
'/splashScreen':(context)=> const SplashScreen(),
'/finalScreen': (context)=>const FinalScreen(),
'/cardspage': (context)=>const CardsPage(),

},
));