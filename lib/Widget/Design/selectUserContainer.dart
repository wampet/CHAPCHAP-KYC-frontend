// ignore_for_file: prefer_const_constructors

import 'package:chapchap_kyc_frontend/Widget/Design/selectUser_clipper.dart';
import 'package:flutter/material.dart';

class SelectUserContainer extends StatelessWidget {
  const SelectUserContainer({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperOne(),
          child: Container(
            height: MediaQuery.of(context).size.height * .55,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text('Select User',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          // height: 5.5
                        )),
                    // Text('Let\'s start by getting to know your business type',
                    //     style: TextStyle(
                    //       color: Colors.white70,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.w400,
                    //     ))
                  ],
                )
                //
                ),
          ),
        ),
      ],
    );
  }
}
