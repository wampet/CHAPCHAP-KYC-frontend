// import 'dart:html';

import 'dart:io';

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:chapchap_kyc_frontend/pages/kyc_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelfieUpload extends StatefulWidget {
  const SelfieUpload({Key? key}) : super(key: key);

  @override
  State<SelfieUpload> createState() => _SelfieUploadState();
}

class _SelfieUploadState extends State<SelfieUpload> {
 File _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual Customer',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 40, 20, 50),
                    child: const Text(
                      'Take your selfie',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              // const CircleAvatar(
              //   backgroundColor: Colors.white,
              //   child: Icon(KycIcons.add_a_photo, size: 80, color: Colors.red),
              //   radius: 80,
              // ),
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/face-scan.png',
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    // decoration: ,
                    width: 150,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    padding: EdgeInsets.all(8),
                    color: Colors.red,
                    child: InkWell(
                      onTap: () {
                        _showPickedOptionsDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              KycIcons.photo_camera,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            child: const Text('Take your selfie',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 60, 20, 50),
                    child: const Text(
                      'Make sure your face fits well within the frame',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: const Text(
                          '1 of 4',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/individualNationalId');
                            },
                            child: Icon(
                              Kyc.right_circle,
                              color: Colors.red,
                              size: 40,
                            ),
                          )),
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

  _loadPicker(ImageSource source) async {
    File picked = await ImagePicker().pickImage(source: source);
    if (picked != null) {
      setState(() {
        _pickedImage = picked as File;
        //picked = _pickedImage;
      });
    }
  }

  void _showPickedOptionsDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text('Pick from Gallery'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Take a Picture'),
                    onTap: () {},
                  )
                ],
              ),
            ));
  }
}
