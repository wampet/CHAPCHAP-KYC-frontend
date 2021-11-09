// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: unused_import
import '../kyc_icons_icons.dart';

//import 'package:intl/intl.dart';
import 'registered_nationalid.dart';

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
                const Text('Upload your National ID ',
                    style: TextStyle(fontSize: 23)),
                const Text(' Pending',
                    style: TextStyle(fontSize: 20, color: Colors.orange))
              ],
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Text('Front', style: TextStyle(fontSize: 23)),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Card(
            

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.5)),
              child: InkWell(
               onTap: (){},
               child: Container(
                 width: 300,
                 height: 200,
                 child: Icon(
                        KycIcons.doc_text_inv,
                        size: 50,
                        color: Colors.red,
                      ),
               ),
              ),
              
            ),
            
            SizedBox(height: 3),
            Row(
              children: [Text('Back', style: TextStyle(fontSize: 23))],
            ),
            SizedBox(
              height: 3,
            ),
            
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.5)),
              child: InkWell(
               onTap: (){},
               child: Container(
                 width: 300,
                 height: 200,
                child: Icon(
                        KycIcons.doc_text_inv,
                        size: 50,
                        color: Colors.red,
                      ),
               ),
              ),
              
            ),
            Row(
              children: [
                Text('1 of 4',
                    style: TextStyle(fontSize: 23, color: Colors.red)),
              
                SizedBox(
                  width: 180,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/selfieUpload');
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
            ),

            
          ],
        ),
      ),

    );
  }


}
