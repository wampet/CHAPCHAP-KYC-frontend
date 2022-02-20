import 'package:chapchap_kyc_frontend/Screens/final_page.dart';
import 'package:chapchap_kyc_frontend/Screens/individual_cards.dart';
import 'package:chapchap_kyc_frontend/Screens/individual_lcletter.dart';
import 'package:chapchap_kyc_frontend/Screens/individual_location.dart';
import 'package:chapchap_kyc_frontend/Screens/individual_nationalid.dart';
import 'package:chapchap_kyc_frontend/Screens/individual_selfie.dart';
import 'package:chapchap_kyc_frontend/Screens/registered_cards.dart';
import 'package:chapchap_kyc_frontend/Screens/registered_lcletter.dart';
import 'package:chapchap_kyc_frontend/Screens/select_user.dart';
import 'package:chapchap_kyc_frontend/Screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'Screens/registered_certificate.dart';
import 'Screens/registered_location.dart';
import 'Screens/registered_nationalid.dart';
import 'Screens/registered_selfie.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/splashScreen',
      routes: {
        '/selfieUpload': (context) => const SelfieUpload(),
        '/splashScreen': (context) => const SplashScreen(),
        '/finalScreen': (context) => const FinalScreen(),
        '/optionalletter': (context) => const IndividualLCletter(),
        '/Lcletter': (context) => const LcLetter(),
        '/cardspage': (context) => const CardsPage(),
        '/selectuser': (context) => const SelectUser(),
        '/individualcards': (context) => const IndividualCards(),
        '/businesscertificate': (context) => const BusinessCertificate(),
        '/individuallocation': (context) => const IndividualLocation(),
        '/businesslocation': (context) => const BusinessLocation(),
        '/businessselfie': (context) => const BusinessSelfie(),
        '/individualNationalId': (context) => const National_id(),
        '/registeredNationalId': (context) => const RegisteredNationalID(),
        // '/upload': (context) => const Home(),
      },
    ));
