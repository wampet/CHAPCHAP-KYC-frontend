import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../kyc_icons_icons.dart';
class RegisteredNationalID extends StatelessWidget {
  const RegisteredNationalID({Key? key}) : super(key: key);

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
            Row(
              children: const [
                Text('Upload your National ID ',
                    style: TextStyle(fontSize: 23)),
                Text(
                  ' Verified',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              children: const [
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
              children: const [Text('Back', style: TextStyle(fontSize: 23))],
            ),
            SizedBox(
              height: 10,
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
                Text('2 of 5',
                    style: TextStyle(fontSize: 23, color: Colors.red)),
                SizedBox(
                  width: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Lcletter');
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
