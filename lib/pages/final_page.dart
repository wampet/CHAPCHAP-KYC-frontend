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
            margin: EdgeInsets.fromLTRB(20,80,20,30),
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
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                     margin: const EdgeInsets.fromLTRB(20, 10, 20, 50),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: const Text(
                  'Your documents have been submitted. Please allow us verify your submission.    We will notify you once we are done',
                  style: TextStyle(color: Colors.red, fontSize: 13.5),
                ),
              ),
            
            ],
          )
        ],
      ),
    );
  }
}
