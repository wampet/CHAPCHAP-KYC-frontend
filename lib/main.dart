
import 'package:chapchap_kyc_frontend/pages/business_location.dart';
import 'package:chapchap_kyc_frontend/pages/cards_page.dart';
import 'package:chapchap_kyc_frontend/pages/final_page.dart';
import 'package:chapchap_kyc_frontend/pages/individual_selfie.dart';
import 'package:chapchap_kyc_frontend/pages/registered_nationalid.dart';
import 'package:chapchap_kyc_frontend/pages/splashscreen.dart';
import 'package:chapchap_kyc_frontend/pages/select_user.dart';
import 'package:chapchap_kyc_frontend/pages/upload_certificate.dart';
import 'package:chapchap_kyc_frontend/pages/upload_location.dart';
import 'package:chapchap_kyc_frontend/pages/upload_selfie.dart';
import 'package:chapchap_kyc_frontend/pages/individual_nationalid.dart';
import 'package:flutter/material.dart';


void main ()=> runApp(MaterialApp(
initialRoute: '/selfieUpload',
routes: {
'/selfieUpload': (context)=> const SelfieUpload(),
'/splashScreen':(context)=> const SplashScreen(),
'/finalScreen': (context)=>const FinalScreen(),
'/cardspage': (context)=>const CardsPage(),
'/selectuser': (context)=>const SelectUser(),
'/businesscertificate': (context)=>const  BusinessCertificate(),
'/businesslocation': (context)=>const BusinessLocation(),
'/businessselfie': (context)=>const BusinessSelfie(),
'/individualselfie': (context)=>const  IndividualSelfie(),
'/individualNationalId': (context)=>const  National_id(),
'/registeredNationalId': (context)=>const  RegisteredNationalID(),







},
));