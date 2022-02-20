// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomCardUploads extends StatelessWidget {
  CustomCardUploads({  required this.navigationFunction, required this.iconUsed,required this.cardLabel,
   
  });
  
  final VoidCallback navigationFunction;
  final IconData iconUsed;
  final String cardLabel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 1),
      color: Colors.red,
      child: InkWell(
        onTap: navigationFunction,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: ListTile(
            leading: Card(
              color: Colors.white,
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  iconUsed,
                  size: 25,
                  color: Colors.red,
                ),
              ),
            ),
            title: Text(cardLabel,
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
