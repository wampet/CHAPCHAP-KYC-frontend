// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
//import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';

class IndividualLCletter extends StatefulWidget {
  const IndividualLCletter({Key? key}) : super(key: key);

  @override
  State<IndividualLCletter> createState() => _IndividualLCletterState();
}

class _IndividualLCletterState extends State<IndividualLCletter> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Individual Owner',
              style: TextStyle(color: Colors.red),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(15.0, 15, 25, 20),
            width: 90.w,
            height: 80.h,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: const StepProgressIndicator(
                                totalSteps: 4,
                                currentStep: 4,
                                selectedColor: Colors.red,
                                unselectedColor: Colors.grey
                            ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Upload your LC1 Letter ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('pending',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  height: 35.h,
                    child: CircleAvatar(
                      radius: 90.0,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        color: Colors.red,
                        onPressed: () {},
                        icon: const Icon(KycIcons.doc_text_inv),
                        iconSize: 100.0,
                      ),
                    )),
                Container(
                  child: Text(
                      'Your upload will help us to serve to \nconfirm your identity',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '4 of 4',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/finalScreen');
                            },
                            child: Icon(
                              KycIcons.navigate_next,
                              color: Colors.red,
                              size: 50,
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}
