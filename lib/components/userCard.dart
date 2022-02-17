
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserCard extends StatelessWidget {
 UserCard({required this.kolor, required this.cardChild, required this.navigationFunction});
final Color kolor;
 final Widget cardChild;
 final VoidCallback navigationFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 30.h,
      width: 30.w,
      child: Card(
                color: kolor,
          child: InkWell(
               onTap:navigationFunction,
               child: cardChild,
          )),
    );
  }
}