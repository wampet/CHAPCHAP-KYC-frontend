import 'package:chapchap_kyc_frontend/pages/Back_individual_nationalid.dart';
import 'package:chapchap_kyc_frontend/pages/Back_registered_nationalid.dart';
import 'package:chapchap_kyc_frontend/pages/business_location.dart';
import 'package:chapchap_kyc_frontend/pages/cards_page.dart';
import 'package:chapchap_kyc_frontend/pages/final_page.dart';
import 'package:chapchap_kyc_frontend/pages/individual_selfie.dart';
import 'package:chapchap_kyc_frontend/pages/Front_registered_nationalid.dart';
import 'package:chapchap_kyc_frontend/pages/splashscreen.dart';
import 'package:chapchap_kyc_frontend/pages/select_user.dart';
import 'package:chapchap_kyc_frontend/pages/upload_certificate.dart';
import 'package:chapchap_kyc_frontend/pages/individual_location.dart';
import 'package:chapchap_kyc_frontend/pages/upload_selfie.dart';
import 'package:chapchap_kyc_frontend/pages/Front_individual_nationalid.dart';
import 'package:chapchap_kyc_frontend/pages/cards.dart';
import 'package:chapchap_kyc_frontend/pages/lc1_letter.dart';
import 'package:chapchap_kyc_frontend/pages/individual_lcletter.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/splashScreen',
      routes: {
        '/selfieUpload': (context) => const SelfieUpload(),
        '/splashScreen': (context) => const SplashScreen(),
        '/finalScreen': (context) => const FinalScreen(),
        '/optionalletter':(context)=>const IndividualLCletter(),
        '/Lcletter':(context)=>const LcLetter(),
        '/cardspage': (context) => const CardsPage(),
        '/selectuser': (context) => const SelectUser(),
        '/individualcards': (context) => const IndividualCards(),
        '/businesscertificate': (context) => const BusinessCertificate(),
        '/individuallocation': (context) => const IndividualLocation(),
        '/businesslocation':(context)=>const BusinessLocation(),
        '/businessselfie': (context) => const BusinessSelfie(),
        '/FrontindividualNationalId': (context) => const FrontIndividual_National_id(),
        '/BackindividualNationalId': (context) => const BackIndividual_National_id(),
        '/FrontregisteredNationalId': (context) => const Front_RegisteredNationalID(),
        '/BackregisteredNationalId': (context) => const Back_RegisteredNationalID(),
      },
    ));
