// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chapchap_kyc_frontend/Widget/customCardUploads.dart';
import 'package:chapchap_kyc_frontend/Widget/topCardsLabel.dart';
import 'package:flutter/material.dart';
import '../kyc_icons_icons.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Registered Company',
            style: TextStyle(
              color: Colors.red,
            )),
        leading: IconButton(
          onPressed: () {
             Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.red,
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        TopCardsInstruction(topCardsLabel: 'Please complete the steps below to register your Profile',),
        CustomCardUploads(
          navigationFunction: () {
            Navigator.pushNamed(context, '/businessselfie');
          },
          iconUsed: KycIcons.user_2,
          cardLabel: 'Upload your Selfie',
        ),
        CustomCardUploads(
          navigationFunction: () {
            Navigator.pushNamed(context, '/registeredNationalId');
          },
          iconUsed: KycIcons.id_card,
          cardLabel: 'Upload your National ID',
        ),
        CustomCardUploads(
          navigationFunction: () {
            Navigator.pushNamed(context, '/businesslocation');
          },
          iconUsed: KycIcons.store_mall_directory,
          cardLabel: 'Upload your Business Shop',
        ),
        CustomCardUploads(
          navigationFunction: () {
            Navigator.pushNamed(context, '/Lcletter');
          },
          iconUsed: KycIcons.doc_text_inv,
          cardLabel: 'Upload your LC1 Letter(Optional)',
        ),
        CustomCardUploads(
          navigationFunction: () {
            Navigator.pushNamed(context, '/businesscertificate');
          },
          iconUsed: KycIcons.doc_text_inv,
          cardLabel: 'Upload your Registration Certificate',
        ),
     
       
       
      ]),
    );
  }
}
