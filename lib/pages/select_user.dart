import 'dart:ui';
import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
              width: 90.w,
              height: 80.h,
              margin :const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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

                  Container(
                    margin: const EdgeInsets.fromLTRB(0,10,0,10),
                    height: 30.h,
                    width: 30.w,
                    child: Card(
                      color: Colors.red,
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/individualcards');
                          },



                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 80.0,
                              ),
                              Text(
                                'Individual Owner',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:16),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0,10,0,10),
                    height: 30.h,
                    width: 30.w,
                    child: Card(
                        color: Colors.red,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/cardspage');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                KycIcons.group,
                                color: Colors.white,
                                size: 80.0,
                              ),
                              Text(
                                'Registered Owner',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              )));
    });
  }
}
