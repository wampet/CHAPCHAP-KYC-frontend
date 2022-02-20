// ignore_for_file: prefer_const_constructors

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0, 50, 15, 0),
            child: IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/selectuser');
                finalScreen(context);
              },
              icon: const Icon(Icons.close) ,
              color: Colors.red,
              ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15,80,15,30),
            child: const Icon(
              KycIcons.check_circle,
              size: 150,
              color: Colors.red,
            ),
          ),
          
          Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: const Text(
                  'Successfully  Uploaded',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                     margin: const EdgeInsets.fromLTRB(15, 10, 10, 50),
                padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                child: const Text(
                  'Your documents have been submitted. Please allow us verify your submission.    We will notify you once we are done',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            
            ],
          )
        ],
      ),
    );
  }

  void finalScreen(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Thank you for your submission"),
      content: Text(
          "You'll receive a message when your account info has been reviewed"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
    );
    showDialog(
        context: context, 
        builder: (BuildContext context) => alertDialog);
  }
}
