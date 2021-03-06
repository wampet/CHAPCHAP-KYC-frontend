// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:chapchap_kyc_frontend/components/custom_card.dart';
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
        Container(
          margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: const Text(
              'Please complete the steps below to register your Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ),
        // CustomCard(),

        //Selfie
        //id
        //letter
        //certificate
        //business location
       Card(
          margin: EdgeInsets.fromLTRB(20, 1, 20, 1),
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/businessselfie');
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
              title: Text('Upload your Profile Picture',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(20, 9, 20, 10),
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/registeredNationalId');
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
          margin: EdgeInsets.fromLTRB(20, 1, 20, 1),
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/Lcletter');
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
              title: Text('Upload your LC Letter',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
        
        Card(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/businesscertificate');
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
              title: Text('Upload your Registration Certificate',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(20, 1, 20, 1),
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/businesslocation');
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
        )
      ]),
    );
  }
}
