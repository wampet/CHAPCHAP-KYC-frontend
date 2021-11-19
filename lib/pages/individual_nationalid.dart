// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors



import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:image_picker/image_picker.dart';


class National_id extends StatelessWidget {
  const National_id({Key? key}) : super(key: key);
  


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
          "Individual Owner",
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 3, 10, 0),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: const StepProgressIndicator(
                                totalSteps: 4,
                                currentStep: 2,
                                selectedColor: Colors.red,
                                unselectedColor: Colors.grey
                            ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: const Text(
                    'Upload your National ID ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 30, 10, 0),
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
            SizedBox(height: 3),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                        child: Text('Front', style: TextStyle(fontSize: 16))),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                DottedBorder(
                  
                  color: Colors.red,
                  strokeWidth: 1,
                  child: Container(
                      // height:,
                      padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                      child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            KycIcons.id_card,
                            color: Colors.red,
                            size: 80,
                          ))),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: Text('Back', style: TextStyle(fontSize: 16))),
                  ],
                ),
               
                DottedBorder(
                  color: Colors.red,
                  strokeWidth: 1,
                  child: Container(
                      // height:,
                      padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                      child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            KycIcons.id_card,
                            color: Colors.red,
                            size: 80,
                          ))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: const Text(
                    '2 of 4',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 Container(
 
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/individuallocation');
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
        ),
      ),
    );
  }
}
