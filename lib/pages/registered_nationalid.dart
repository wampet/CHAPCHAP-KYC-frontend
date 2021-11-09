// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../kyc_icons_icons.dart';

class RegisteredNationalID extends StatelessWidget {
  const RegisteredNationalID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.red,
          iconSize: 30,
        ),
        backgroundColor: Colors.white70,
        title: const Text(
          "Registered Company",
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
       body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                  child: const Text(
                    'Progress',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 3, 10, 0),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: const LinearProgressIndicator(
                      value: 0.7,
                      backgroundColor: Colors.grey,
                      minHeight: 10,
                      color: Colors.red),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: const Text(
                    'Upload your National ID ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 30, 10, 0),
                  child: const Text(
                    'pending',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 9,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                        child: Text('Front', style: TextStyle(fontSize: 16))),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                DottedBorder(
                  
                  color: Colors.red,
                  strokeWidth: 1,
                  child: Container(
                      // height:,
                      padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                      child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            KycIcons.id_card,
                            color: Colors.red,
                            size: 80,
                          ))),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: Text('Back', style: TextStyle(fontSize: 16))),
                  ],
                ),
               
                DottedBorder(
                  color: Colors.red,
                  strokeWidth: 1,
                  child: Container(
                      // height:,
                      padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                      child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            KycIcons.id_card,
                            color: Colors.red,
                            size: 80,
                          ))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: const Text(
                    '1 of 3',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Lcletter');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: const Text('Next',
                          style: TextStyle(color: Colors.white))),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
