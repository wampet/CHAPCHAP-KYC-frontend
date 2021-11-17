import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


import 'dart:async';
//import 'dart:io';

import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:video_player/video_player.dart';

class BusinessLocation extends StatefulWidget {
  const BusinessLocation({ Key? key }) : super(key: key);

  @override
  _BusinessLocationState createState() => _BusinessLocationState();
}

class _BusinessLocationState extends State<BusinessLocation> {
   File? _image;
    final ImagePicker _picker = ImagePicker();
   Future<void> getImage()async{
  final image =await _picker.pickImage(source: ImageSource.camera);
  if(image != null){
    setState(()=> _image = File(image.path));
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Company',
            style: TextStyle(
              color: Colors.red,
            )),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 600.0),
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                    child: const Text(
                      'Progress',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 3, 20, 0),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: const LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Colors.grey,
                        minHeight: 10,
                        color: Colors.red),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 40, 20, 50),
                    child: const Text(
                      'Upload your business Premises',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 40, 20, 50),
                    child: const Text(
                      'pending',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                //backgroundColor: Colors.white,
                //radius: 70,
                child:_image==null ? InkWell(
                  onTap: getImage,
                  // onTap: (){
                  //   print('object');
                  // },
                  child: Container(
                    child:Text('Upload Your image') ,
                  )):Image.file(_image!),
                //   child: Icon(KycIcons.add_a_photo, size: 80, color: Colors.red))
                // :Image.file(_image!)
              ),
              Column(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 60, 20, 50),
                    child: const Text(
                      'Your upload will help us to know your location and to serve you better.',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: const Text(
                          '5 of 5',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        padding:const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/finalScreen');
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            child: const Text('Next',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
