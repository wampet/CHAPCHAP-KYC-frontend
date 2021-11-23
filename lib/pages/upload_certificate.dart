// ignore_for_file: prefer_const_constructors

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BusinessCertificate extends StatefulWidget {
  const BusinessCertificate({Key? key}) : super(key: key);

  @override
  _BusinessCertificateState createState() => _BusinessCertificateState();
}

class _BusinessCertificateState extends State<BusinessCertificate> {
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
              icon: const Icon(KycIcons.arrow_back),
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
                          currentStep: 4,
                          selectedColor: Colors.red,
                          unselectedColor: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Upload your Certificate \nof incorporation',
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
                  child: Card(
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          color: Colors.red,
                          onPressed: () {},
                          icon: const Icon(KycIcons.add_a_photo),
                          iconSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
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
                          '4 of 5',
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
                                    context, '/businesslocation');
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
