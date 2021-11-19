import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndividualLocation extends StatefulWidget {
  const IndividualLocation({Key? key}) : super(key: key);

  @override
  _IndividualLocationState createState() => _IndividualLocationState();
}

class _IndividualLocationState extends State<IndividualLocation> {
  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(KycIcons.arrow_back),
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(15.0, 15, 15, 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: const Text(
                      'Progress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.fromLTRB(0, 5, 10, 30),
                    child: const LinearProgressIndicator(
                        value: 0.9,
                        backgroundColor: Colors.grey,
                        minHeight: 10,
                        color: Colors.red),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Upload your \nBusiness Premises',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  //  SizedBox(width: 10),
                  Text('pending',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
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
                        '3 of 4',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/optionalletter');
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
