
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
 UserCard({ required this.cardChild, required this.navigationFunction});
 final Widget cardChild;
 final VoidCallback navigationFunction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:navigationFunction,
      child: Container(
        margin: const EdgeInsets.all(10),
          height:70,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow:kElevationToShadow[3],),
        // height: 20,
        // width: 30.w,
        child: cardChild,
      ),
    );
  }
}