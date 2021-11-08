import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';

class IndividualSelfie extends StatefulWidget {
  const IndividualSelfie({Key? key}) : super(key: key);

  @override
  State IndividualSelfie> createState() =>  IndividualSelfieState();
}

class  IndividualSelfieState extends State IndividualSelfie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registerd Company',
            style: TextStyle(
              color: Colors.red,
            )),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
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
                    margin: const EdgeInsets.fromLTRB(20, 40, 20, 50),
                    child: const Text(
                      'Upload your business Premises',
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
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(KycIcons.add_a_photo, size: 80, color: Colors.red),
                radius: 80,
              ),
              Column(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 60, 20, 50),
                    child: const Text(
                      'Your upload will help us to know your location and to serve you better.',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: const Text(
                          '1 of 5',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        padding:const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/cardspage');
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            child: const Text('Next',
                                style: TextStyle(color: Colors.white))),
                      ),
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
