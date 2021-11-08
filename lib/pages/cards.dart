
import 'package:flutter/material.dart';
import 'national-id.dart';

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
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Progress', style: TextStyle(fontSize: 25)),

            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              value: 0.1,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              minHeight: 15,
            ),
            SizedBox(height: 10),
            Text('Please complete the steps below to complete Your Profile',
                style: TextStyle(fontSize: 23)),
            //Card1(),
            SizedBox(height: 30),
            Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.5)),
                child: Center(
                  //heightFactor: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),

                      
                      Card(
                          child:
                              Icon(Icons.camera, color: Colors.red, size: 50)),

                      Text(
                        '  Capture Your Selfie',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 120,
                      )
                    ],
                  ),
                )),
            
            SizedBox(height: 30),
            Card(
              color: Colors.red,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.5)),
              
              child: Center(
                  
                  child: Row(
                children: [
                  SizedBox(
                    width: 10,
                    height: 90,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => National_id()));
                      },
                    ),
                  ),
                  Card(
                      child: Icon(Icons.insert_drive_file,
                          size: 50, color: Colors.red)),
                  Text('Upload Your National ID',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(
                    height: 120,
                    width: 80,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => National_id()));
                      },
                    ),
                  )
                ],
              )
  
                  ),
            ),
            SizedBox(
              height: 30,
            ),
            
            Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.5)),
                child: Center(
               
                  child: Row(
                    children: [
                   

                      SizedBox(
                        width: 10,
                      ),
                      Card(
                        child: Icon(
                          Icons.holiday_village,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),

                      const Text('  Upload Your Business Location',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      SizedBox(
                        height: 110,
                      )
                    ],
                  ),
                )),
            
          ],
        ),
      ),
      
    );
  }

  
}
