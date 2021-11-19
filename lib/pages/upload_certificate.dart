// ignore_for_file: prefer_const_constructors

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class BusinessCertificate extends StatefulWidget {
  const BusinessCertificate({Key? key}) : super(key: key);

  @override
  _BusinessCertificateState createState() => _BusinessCertificateState();
}

class _BusinessCertificateState extends State<BusinessCertificate> {
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
            icon: const Icon(KycIcons.arrow_back),
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
                                currentStep: 4,
                                selectedColor: Colors.red,
                                unselectedColor: Colors.grey
                            ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                          'Upload your Certificate \nof incorporation',
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
            Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
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
                        '4 of 5',
                        style: TextStyle(color: Colors.red),
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
  }
}
