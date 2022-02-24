
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TopCardsInstruction extends StatelessWidget {
  TopCardsInstruction({required this.topCardsLabel});
  final String topCardsLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 20, 20, 8),
      child: Text(topCardsLabel,
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500)),
    );
  }
}