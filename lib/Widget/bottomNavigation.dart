// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {required this.navigationLabel, required this.bottomNavigationFunction});
  final String navigationLabel;
  final VoidCallback bottomNavigationFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            navigationLabel,
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: FloatingActionButton(
              onPressed: bottomNavigationFunction,
              backgroundColor: Colors.white,
              child: Icon(
                KycIcons.navigate_next,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
