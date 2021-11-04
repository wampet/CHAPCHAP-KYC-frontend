// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
//import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: National_id()));
}

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
            const Text('Progress', style: TextStyle(fontSize: 25)),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              value: 0.4,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              minHeight: 15,
            ),
            Row(
              children: [
                const Text('Upload your National ID   ',
                    style: TextStyle(fontSize: 23)),
                const Text(
                  '    Pending',
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Front', style: TextStyle(fontSize: 23)),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              //color: Colors.red,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              //child: Center(
              child: Center(
                  heightFactor: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                      ),
                      Icon(Icons.insert_drive_file,
                          size: 50, color: Colors.black),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  )
                  //Image.asset('assets/images/id.jpg')
                  // Icon(Icons.insert_drive_file, size: 50, color: Colors.white),
                  // const Text('Upload Your National ID',
                  //     style: TextStyle(color: Colors.white, fontSize: 15)),

                  //)
                  ),
            ),
            //Card1(),
            SizedBox(height: 10),
            Row(
              children: [Text('Back', style: TextStyle(fontSize: 23))],
            ),
            SizedBox(
              height: 10,
            ),
            //Card2(),
            Card(
              //color: Colors.red,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              //child: Center(
              child: Center(
                  heightFactor: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                      ),
                      Icon(Icons.insert_drive_file,
                          size: 50, color: Colors.black),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  )
                  //Image.asset('assets/images/id.jpg')
                  // Icon(Icons.insert_drive_file, size: 50, color: Colors.white),
                  // const Text('Upload Your National ID',
                  //     style: TextStyle(color: Colors.white, fontSize: 15)),

                  //)
                  ),
            ),
            Row(
              children: [
                Text('2 of 3',
                    style: TextStyle(fontSize: 23, color: Colors.red)),
                // 2 of 3 text on the far bottom left
                SizedBox(
                  width: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Next');
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
            ),

            //This is be the button that is on the far bottom Right
          ],
        ),
      ),
      //backgroundColor: Colors.white70,
    );
  }

  // ignore: non_constant_identifier_names
  Widget Card1() => Card(
      //color: Colors.white60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.insert_drive_file,
              size: 45,
            ),
            //const Text('Front'),
            //Image.asset('assets/images/camera.jpg'),
            //SizedBox(height: 100, width: 350),

            SizedBox(
              height: 100,
              width: 300,
              child: GestureDetector(
                onDoubleTap: () {
                  print('Front National ID');
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return National_id();
                  // }));
                },
              ),
            ),
          ],
        ),
      ));

  // ignore: non_constant_identifier_names
  // Widget Card2() => Card(
  //       color: Colors.red,

  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       //child: Center(
  //       child: Center(
  //           heightFactor: 2,
  //           child: Row(
  //             children: [
  //               SizedBox(
  //                 width: 10,
  //               ),
  //               IconButton(
  //                   onPressed: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => National_id()));
  //                   },
  //                   icon: Icon(Icons.ac_unit_rounded)),
  //               Icon(Icons.insert_drive_file, size: 50, color: Colors.white),
  //               Text('Upload Your National ID',
  //                   style: TextStyle(color: Colors.white, fontSize: 16)),
  //             ],
  //           )
  //           //Image.asset('assets/images/id.jpg')
  //           // Icon(Icons.insert_drive_file, size: 50, color: Colors.white),
  //           // const Text('Upload Your National ID',
  //           //     style: TextStyle(color: Colors.white, fontSize: 15)),

  //           //)
  //           ),
  //     );

  ///This is for the Button
  // ignore: non_constant_identifier_names

}
