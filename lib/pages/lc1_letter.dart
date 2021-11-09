import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                const Text('Upload Your LC1 Letter ',
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
                child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 300,
                      height: 250,
                      child: Icon(
                        KycIcons.doc_text_inv,
                        size: 50,
                        color: Colors.red,
                      ),
                    ))),
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
                    Navigator.pushNamed(context, '/businessselfie');
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
