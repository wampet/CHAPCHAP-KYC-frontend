// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: unused_import

//import 'package:intl/intl.dart';
import 'n_id.dart';

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
              
              child: Center(
               
                  child: Row(
                children: [
                  SizedBox(
                    width: 122,
                    height: 180,
                    child: GestureDetector(
                      onTap: () {
                        print('object');
                      },
                    ),
                  ),
                  Icon(Icons.insert_drive_file, size: 50, color: Colors.black),
                  SizedBox(
                    width: 150,
                    height: 140,
                    child: GestureDetector(
                      onTap: () {
                        print('object');
                      },
                    ),
                  ),
                ],
              )
                  
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
              
              child: Center(
                  
                  child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 180,
                    child: GestureDetector(
                      onTap: () {
                        print('object');
                      },
                    ),
                  ),
                  Icon(Icons.insert_drive_file, size: 50, color: Colors.black),
                  SizedBox(
                    width: 150,
                    height: 140,
                    child: GestureDetector(
                      onTap: () {
                        print('object');
                      },
                    ),
                  ),
                ],
              )
                  
                  ),
            ),
            Row(
              children: [
                Text('2 of 5',
                    style: TextStyle(fontSize: 23, color: Colors.red)),
              
                SizedBox(
                  width: 180,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => n_id()));
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
