// ignore_for_file: prefer_const_constructors

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
        
        Container(
          margin: const EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: const Text(
              'Please complete the steps below to register your Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ),
        // CustomCard(),
        //selfie
        //id
        //business location
        //LCletter
         Card(
          margin: EdgeInsets.fromLTRB(20, 1, 20, 1),
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/selfieUpload');
            },
            child: ListTile(
              leading: Card(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    KycIcons.doc_text_inv,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
              title: Text('Upload your Selfie',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(20, 9, 20, 1),
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/individualNationalId');
            },
            child: ListTile(
              leading: Card(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    KycIcons.id_card,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
              title: Text('Upload your National ID',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),

       

        Card(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 1),
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/individuallocation');
            },
            child: ListTile(
              leading: Card(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    KycIcons.store_mall_directory,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
              title: Text('Upload your Business location',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 1),
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/optionalletter');
            },
            child: ListTile(
              leading: Card(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    KycIcons.doc_text_inv,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
              title: Text('Upload your LC1 Letter(Optional)',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        )
      ]),
    );
  }
}
