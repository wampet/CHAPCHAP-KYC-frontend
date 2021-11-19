// ignore_for_file: prefer_const_constructors

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                        margin: const EdgeInsets.only(left: 10.0),
                        child: const Text(
                          'Progress',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.all(10),
                        child: const LinearProgressIndicator(
                            value: 0.7,
                            backgroundColor: Colors.grey,
                            minHeight: 10,
                            color: Colors.red),
                      ),
                    ],
                  )),
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
        
                     
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(primary: Colors.red),
                      //     onPressed: () {
                      //       Navigator.pushNamed(
                      //           context, '/registeredNationalId');
                      //     },
                      //     child: const Text('Next'))
                    ],
                  ))
            ],
          ),
        ));
  }
}
