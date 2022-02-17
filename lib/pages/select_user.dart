// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:chapchap_kyc_frontend/components/userCard.dart';
import 'package:chapchap_kyc_frontend/components/userCardContent.dart';
// import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../kyc_icons_icons.dart';

class SelectUser extends StatelessWidget {
  const SelectUser({Key? key}) : super(key: key);

  final String text = 'Hello, Let\'s start by getting to know your business ';
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Profile',
              style: TextStyle(color: Colors.red),
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
              // width: 90.w,
              // height: 80.h,
              margin: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const <Widget>[
                          Text('Hello John',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                          Text(
                            'Let\'s start by getting to know your business type',
                            style: TextStyle(fontSize: 15.0),
                          )
                        ]),
                  ),
                  Expanded(
                    child: UserCard(
                        kolor: Colors.red,
                        navigationFunction: () {
                          Navigator.pushNamed(context, '/individualcards');
                        },
                        cardChild: UserCardContent(
                            userIcon: Icons.person,
                            userLabel: 'Individual Owner')),
                  ),
                  Expanded(
                    child: UserCard(
                        kolor: Colors.red,
                        navigationFunction: () {
                          Navigator.pushNamed(context, '/cardspage');
                        },
                        cardChild: UserCardContent(
                            userIcon: KycIcons.group,
                            userLabel: 'Registered Owner')),
                  ),
                ],
              )));
    });
  }
}
