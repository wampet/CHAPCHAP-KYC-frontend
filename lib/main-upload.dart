import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import 'national-id.dart';
//import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  //static BuildContext context;
  Widget build(BuildContext context) {
    //BuildContext context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            //Go back to previous Page
          },
          color: Colors.red,
          iconSize: 30,
        ),
        backgroundColor: Colors.white70,
        title:
            const Text("Individual Owner", style: TextStyle(color: Colors.red)),
        centerTitle: true,
      ),
      // body: Container(
      //     child: Stack(children: [
      //   Positioned(top: 10, child: Text('Progress')),
      //   Positioned(
      //       child: LinearProgressIndicator(
      //     backgroundColor: Colors.grey,
      //     color: Colors.red,
      //     value: 2,
      //     minHeight: 15,
      //   )),
      //   Positioned(
      //     top: 48.0,
      //     child: Text(
      //       'Please complete the steps below to complete Your Profile',
      //       style: TextStyle(fontSize: 13),
      //     ),
      //   ),
      //   Positioned(
      //       top: 60.0,
      //       width: 300.0,
      //       height: 180.0,
      //       left: 30,
      //       child: Card(
      //           color: Colors.red,
      //           child: Center(
      //               child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                 Icon(Icons.insert_drive_file,
      //                     size: 50, color: Colors.white),
      //                 const Text('Upload Your National ID',
      //                     style:
      //                         TextStyle(color: Colors.white, fontSize: 18)),
      //                 SizedBox(
      //                     height: 80,
      //                     width: 300,
      //                     child: GestureDetector(onDoubleTap: () {
      //                       print('Hello World');
      //                       Navigator.push(context,
      //                           MaterialPageRoute(builder: (context) {
      //                         return National_id();
      //                       }));
      //                     })),
      //               ])))),
      //   Positioned(
      //       top: 250,
      //       width: 300.0,
      //       height: 180.0,
      //       left: 30,
      //       child: Card(
      //           color: Colors.red,
      //           child: Center(
      //               child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                 Icon(Icons.holiday_village,
      //                     size: 50, color: Colors.white),
      //                 const Text('Upload Your Business Location',
      //                     style:
      //                         TextStyle(color: Colors.white, fontSize: 18)),
      //                 // SizedBox(
      //                 //     //height: 100,
      //                 //     //width: 300,
      //                 //     child: GestureDetector(onDoubleTap: () {
      //                 //   print('Hello World');
      //                 //   Navigator.push(context,
      //                 //       MaterialPageRoute(builder: (context) {
      //                 //     return National_id();
      //                 //   }));
      //                 // }))
      //               ]
      //                   //
      //                   )))),
      //   Positioned(
      //       top: 430.0,
      //       width: 300.0,
      //       height: 180.0,
      //       left: 30,
      //       child: Card(
      //           color: Colors.red,
      //           child: Center(
      //               child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                 Icon(Icons.camera, size: 50, color: Colors.white),
      //                 Text('Capture Your Selfie',
      //                     style:
      //                         TextStyle(color: Colors.white, fontSize: 18)),
      //                 // SizedBox(
      //                 //     //height: 100,
      //                 //     //width: 300,
      //                 //     child: GestureDetector(onDoubleTap: () {
      //                 //   print('Hello World');
      //                 //   Navigator.push(context,
      //                 //       MaterialPageRoute(builder: (context) {
      //                 //     return National_id();
      //                 //   }));
      //                 // }))
      //               ]
      //                   //
      //                   )))),
      // ]))
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Progress', style: TextStyle(fontSize: 25)),

            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              value: 0.4,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              minHeight: 15,
            ),
            SizedBox(height: 10),
            Text('Please complete the steps below to complete Your Profile',
                style: TextStyle(fontSize: 23)),
            //Card1(),
            SizedBox(height: 10),
            Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  heightFactor: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),

                      //Image.asset('assets/images/camera.jpg'),
                      //SizedBox(height: 100, width: 300),
                      Icon(Icons.camera, color: Colors.white, size: 50),
                      Text(
                        '  Capture Your Selfie',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                )),
            //Card2()
            SizedBox(height: 10),
            Card(
              color: Colors.red,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              //child: Center(
              child: Center(
                  heightFactor: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => National_id()));
                          },
                          icon: Icon(Icons.ac_unit_rounded)),
                      Icon(Icons.insert_drive_file,
                          size: 50, color: Colors.white),
                      Text('Upload Your National ID',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  )
                  //Image.asset('assets/images/id.jpg')
                  // Icon(Icons.insert_drive_file, size: 50, color: Colors.white),
                  // const Text('Upload Your National ID',
                  //     style: TextStyle(color: Colors.white, fontSize: 15)),

                  //)
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            //Card3()
            Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  heightFactor: 2,
                  child: Row(
                    children: [
                      //const SizedBox(height: 100, width: 300),
                      //Image.asset('assets/images/business.jpg')

                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.holiday_village,
                        color: Colors.white,
                        size: 50,
                      ),
                      const Text('  Upload Your Business Location',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                )),
            SizedBox(height: 10),
            //SizedBox(height: 10),
            //SizedBox(height: 10),
          ],
        ),
      ),
      //backgroundColor: Colors.white70,
    );
  }

  // Widget Card1() => Card(
  //       //color: Colors.white60,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //       child: Column(
  //         children: [
  //           Text('Upload Your National ID'),
  //           SizedBox(
  //             height: 100,
  //             width: 350,
  //           ),
  //           //Image.asset('assets/images/id.jpg')
  //           Icon(Icons.insert_drive_file),
  //           GestureDetector(
  //             onTap: () {
  //               print('Hello World');

  //               Navigator.push(MyApp.context,
  //                   MaterialPageRoute(builder: (context) {
  //                 return National_id();
  //               }));
  //             },
  //           ),
  //         ],
  //       ),
  //     );
  // // ignore: non_constant_identifier_names
  // Widget Card2() => Card(
  //       //color: Colors.white60,
  //       child: Column(
  //         children: [
  //           Text('Capture Your Selfie'),
  //           //Image.asset('assets/images/camera.jpg'),
  //           SizedBox(height: 100, width: 350),
  //           Icon(Icons.camera),
  //         ],
  //       ),
  //     );

  // // ignore: non_constant_identifier_names

  // // ignore: non_constant_identifier_names
  // Widget Card3() => Card(
  //       //color: Colors.white60,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //       child: Column(
  //         children: [
  //           const Text('Upload Your Business Location'),
  //           const SizedBox(height: 100, width: 350),
  //           //Image.asset('assets/images/business.jpg')
  //           Icon(Icons.holiday_village)
  //         ],
  //       ),
  //     );
}
