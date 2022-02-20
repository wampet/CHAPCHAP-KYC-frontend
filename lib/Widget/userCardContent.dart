// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class UserCardContent extends StatelessWidget {
UserCardContent({required this.userIcon, required this.userLabel    });
final IconData userIcon;
final String userLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  userIcon,
                  color: Colors.red,
                  size: 80.0,
                ),
                Text(
                 userLabel,
                  style: TextStyle(
                      color: Colors.grey[800]
                      ,
                      fontWeight: FontWeight.bold,
                      fontSize:22),
                ),
              ],
            );
  }
}
