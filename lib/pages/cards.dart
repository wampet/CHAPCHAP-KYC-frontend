// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:chapchap_kyc_frontend/components/customCardUploads.dart';
import 'package:chapchap_kyc_frontend/components/topCardsLabel.dart';
import 'package:flutter/material.dart';

import '../kyc_icons_icons.dart';

class IndividualCards extends StatefulWidget {
  const IndividualCards({Key? key}) : super(key: key);

  @override
  IndividualCardsState createState() => IndividualCardsState();
}

class IndividualCardsState extends State<IndividualCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Individual Owner',
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
            Navigator.pushNamed(context, '/selfieUpload');
          },
          iconUsed: KycIcons.user_2,
          cardLabel: 'Upload your Selfie',
        ),
        CustomCardUploads(
          navigationFunction: () {
            Navigator.pushNamed(context, '/individualNationalId');
          },
          iconUsed: KycIcons.id_card,
          cardLabel: 'Upload your National ID',
        ),
        CustomCardUploads(
          navigationFunction: () {
            Navigator.pushNamed(context, '/individuallocation');
          },
          iconUsed: KycIcons.store_mall_directory,
          cardLabel: 'Upload your Business Shop',
        ),
        CustomCardUploads(
          navigationFunction: () {
            Navigator.pushNamed(context, '/optionalletter');
          },
          iconUsed: KycIcons.doc_text_inv,
          cardLabel: 'Upload your LC1 Letter(Optional)',
        ),
      ]),
    );
  }
}


