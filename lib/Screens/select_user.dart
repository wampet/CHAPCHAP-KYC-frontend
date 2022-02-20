// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

// import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:chapchap_kyc_frontend/Widget/Design/selectUserContainer.dart';
import 'package:chapchap_kyc_frontend/Widget/userCard.dart';
import 'package:chapchap_kyc_frontend/Widget/userCardContent.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../kyc_icons_icons.dart';

class SelectUser extends StatelessWidget {
  const SelectUser({Key? key}) : super(key: key);

  final String text = 'Hello, Let\'s start by getting to know your business ';
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
          children: [
            SelectUserContainer(),
             
            Container(
                margin: const EdgeInsets.fromLTRB(5.0, 100.0, 5.0, 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   
                    Expanded(
                      child: UserCard(
                          navigationFunction: () {
                            Navigator.pushNamed(context, '/individualcards');
                          },
                          cardChild: UserCardContent(
                              userIcon: Icons.person,
                              userLabel: 'Individual Owner')),
                    ),
                    Expanded(
                      child: UserCard(
                          navigationFunction: () {
                            Navigator.pushNamed(context, '/cardspage');
                          },
                          cardChild: UserCardContent(
                              userIcon: KycIcons.group,
                              userLabel: 'Registered Owner')),
                    ),
                  ],
                )),
          ],
        ));
  }
}
