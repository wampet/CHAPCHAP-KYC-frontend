import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../kyc_icons_icons.dart';

class OptionalLetter extends StatefulWidget {
  const OptionalLetter({Key? key}) : super(key: key);

  @override
  State<OptionalLetter> createState() => _OptionalLetterState();
}

class _OptionalLetterState extends State<OptionalLetter> {
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
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                const Text('Upload a Letter from Your LC1 Chairperson ',
                    style: TextStyle(fontSize: 16)),
                    Text('(Optional)',
                    style: TextStyle(fontSize: 16))
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
            SizedBox(height: 70),
            Text('Your Upload will help us confirm your identity',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(
                  width: 7,
                ),
                Text('4 of 4',
                    style: TextStyle(fontSize: 23, color: Colors.red)),
                SizedBox(
                  width: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/finalScreen');
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
