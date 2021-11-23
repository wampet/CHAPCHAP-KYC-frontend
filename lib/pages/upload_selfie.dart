// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BusinessSelfie extends StatefulWidget {
  const BusinessSelfie({Key? key}) : super(key: key);

  @override
  _BusinessSelfieState createState() => _BusinessSelfieState();
}

class _BusinessSelfieState extends State<BusinessSelfie> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Registered Company',
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
                          totalSteps: 5,
                          currentStep: 1,
                          selectedColor: Colors.red,
                          unselectedColor: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Image.asset('assets/normal.png',
                            height: 50, width: 60),
                      ),
                      Text('Good',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 7,
                          )),
                    ]),
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Image.asset('assets/cut.png',
                            height: 50, width: 60),
                      ),
                      Text('Not cut',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 7,
                          )),
                    ]),
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Image.asset('assets/blurry.png',
                            height: 50, width: 60),
                      ),
                      Text('Not blur',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 7,
                          )),
                    ]),
                    Column(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                        child: Image.asset('assets/reflective.png',
                            height: 50, width: 60),
                      ),
                      Text('Not reflective',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 7,
                          )),
                    ])
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Take a Selfie',
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
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 25, 0, 30),
                  height: 30.h,
                    child: CircleAvatar(
                      radius: 90.0,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        color: Colors.red,
                        onPressed: () {},
                        icon: const Icon(KycIcons.add_a_photo),
                        iconSize: 100.0,
                      ),
                    )),
                Container(
                    child: Text(
                        'Your upload will help us to serve to \nconfirm your identity',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ))),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '1 of 5',
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
                                Navigator.pushNamed(
                                    context, '/registeredNationalId');
                              },
                              child: Icon(
                                KycIcons.navigate_next,
                                color: Colors.red,
                                size: 50,
                              ),
                            )),
                      ],
                    ))
              ],
            ),
          ));
    });
  }
}
