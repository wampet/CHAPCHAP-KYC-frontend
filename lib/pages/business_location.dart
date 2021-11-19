// ignore_for_file: prefer_const_constructors

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';


class BusinessLocation extends StatefulWidget {
  const BusinessLocation({ Key? key }) : super(key: key);

  @override
  _BusinessLocationState createState() => _BusinessLocationState();
}

class _BusinessLocationState extends State<BusinessLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Company',
            style: TextStyle(
              color: Colors.red,
            )),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 600.0),
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                    child: const Text(
                      'Progress',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 3, 20, 0),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: const LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Colors.grey,
                        minHeight: 10,
                        color: Colors.red),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 40, 10, 50),
                    child: const Text(
                      'Upload your business \nShop',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 40, 20, 50),
                    child: const Text(
                      'pending',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
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
              Column(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 60, 10, 50),
                    child: const Text(
                      'Your upload will help us to know your location and to serve you better.',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: const Text(
                          '5 of 5',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                       Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/finalScreen');
                          },
                          child: Icon(
                            KycIcons.navigate_next,
                            color: Colors.red,
                            size: 50,
                          ),
                        )),
                      
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
