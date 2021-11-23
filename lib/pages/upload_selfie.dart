// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BusinessSelfie extends StatefulWidget {
  const BusinessSelfie({Key? key}) : super(key: key);

  @override
  _BusinessSelfieState createState() => _BusinessSelfieState();
}

class _BusinessSelfieState extends State<BusinessSelfie> {
  @override
  Widget build(BuildContext context) {
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
          margin: const EdgeInsets.fromLTRB(25.0, 15, 25, 25),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.all(10),
                        child: const StepProgressIndicator(
                            totalSteps: 5,
                            currentStep: 1,
                            selectedColor: Colors.red,
                            unselectedColor: Colors.grey),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Column(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                      child:
                          Image.asset('assets/normal.png', height: 50, width: 60),
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
                      child:
                          Image.asset('assets/cut.png', height: 50, width: 60),
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
                      child:
                          Image.asset('assets/blurry.png', height: 50, width: 60),
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
                      child:
                          Image.asset('assets/reflective.png', height: 50, width: 60),
                    ),
                    Text('Not reflective',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 7,
                        )),
                  ])
                ],
              ),
              Expanded(
                  flex: 1,
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
                  )),
              Expanded(
                  flex: 4,
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
              const Expanded(
                  flex: 1,
                  child: Text(
                      'Your upload will help us to serve to \nconfirm your identity',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ))),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '1 of 5',
                        style: TextStyle(color: Colors.red),
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
  }
}
