// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';

class LcLetter extends StatefulWidget {
  const LcLetter({Key? key}) : super(key: key);

  @override
  State<LcLetter> createState() => _LcLetterState();
}

class _LcLetterState extends State<LcLetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.red,
          iconSize: 30,
        ),
        backgroundColor: Colors.white70,
        title: const Text(
          "Registered Company",
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      body:  Container(  
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
                                currentStep: 3,
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
                    'Upload your LC1 Letter ',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                          )
                       ),
                      Text(
                    'pending',
                    style: TextStyle(color: Colors.amber,
                    fontWeight: FontWeight.bold,)
                    )
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Card(
                  color: Colors.white,
                  child: Container(
                    
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        color: Colors.red,
                        onPressed: () {},
                        icon: const Icon(KycIcons.doc_text_inv),
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
                  )
                  )),
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Text('3 of 5',
                    style: TextStyle(color: Colors.red),),
                        Container(
 
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/businesscertificate');
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
         )
    );
  }
}
