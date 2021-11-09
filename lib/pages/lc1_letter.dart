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
      body:  Container(  
           margin: const EdgeInsets.fromLTRB(25.0, 15, 25, 25),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: const Text(
                        'Progress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ) ,
                    Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.all(10),
                      child: const LinearProgressIndicator(
                          value: 0.7,
                          backgroundColor: Colors.grey,
                          minHeight: 10,
                          color: Colors.red
                      ) ,
                    ),
                  ],
              )),
              
            Expanded(
              flex: 1,
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                    'Upload your LC1 Letter ',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                          )
                       ),
                      Text(
                    'pending',
                    style: TextStyle(color: Colors.amber,
                    fontWeight: FontWeight.bold,)
                    )
                    ],
                  )
              ),
              Expanded(
                flex: 4,
                child: CircleAvatar(
                    radius: 90.0,
                    backgroundColor: Colors.white,
                    child: IconButton( 
                      color: Colors.red,
                    onPressed: (){}, 
                    icon: const Icon(KycIcons.doc_text_inv),
                    iconSize: 100.0,),
                  )),
              const Expanded(
                flex: 1,
                child: Text(
                  'Your upload will help us to serve to \nconfirm your identity',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  )
                  )),
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Text('2 of 5',
                    style: TextStyle(color: Colors.red),),
                    const SizedBox(width: 200),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: (){
                         Navigator.pushNamed(context, '/finalScreen');
                      }, 
                      child: const Text('Next'))
                  ],
                ))
            ],
         ),
         )
    );
  }
}
