// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: unused_import

//import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: lc1_letter()));
}

class lc1_letter extends StatelessWidget {
  const lc1_letter({Key? key}) : super(key: key);

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
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text('Upload a Letter from Your LC1 Chairperson ',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
            const Text('Verified',
                style: TextStyle(fontSize: 16, color: Colors.green)),
            SizedBox(height: 10),

            SizedBox(
              height: 40,
            ),
            Card(
    

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.5)),
              
              child: Center(
                  
                  child: Row(
                children: [
                  SizedBox(
                    width: 140,
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        print('object');
                      },
                    ),
                  ),
                  Icon(Icons.camera, size: 50, color: Colors.red),
                  SizedBox(
                    width: 120,
                    height: 200,
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
            
            SizedBox(height: 60),

            SizedBox(
              height: 10,
            ),
            Text('Your Upload will help us confirm your identity',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(
                  width: 7,
                ),
                Text('2 of 5',
                    style: TextStyle(fontSize: 23, color: Colors.red)),
                
                SizedBox(
                  width: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                    
                    print('object Pressed');
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
