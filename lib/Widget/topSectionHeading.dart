// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TopHeading extends StatelessWidget {
   const TopHeading({required this.instructionLabel,
  
  }); 
final String instructionLabel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
         instructionLabel,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
          child: const Text(
            'pending',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
