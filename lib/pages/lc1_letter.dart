// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LcLetter extends StatefulWidget {
  const LcLetter({Key? key}) : super(key: key);

  @override
  State<LcLetter> createState() => _LcLetterState();
}

class _LcLetterState extends State<LcLetter> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Future<void> getImage() async {
    final image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() => _image = File(image.path));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
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
            backgroundColor: Colors.white,
            title: const Text(
              "Registered Company",
              style: TextStyle(color: Colors.red),
            ),
            centerTitle: true,
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(15.0, 15, 15, 20),
            width: 90.w,
            height: 90.h,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: const StepProgressIndicator(
                          totalSteps: 5,
                          currentStep: 3,
                          selectedColor: Colors.red,
                          unselectedColor: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text('Upload your LC1 Letter ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                        if(_image==null)
                         Text('pending',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9)),
                        if(_image!=null)
                         Text('Verified',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9)),
                    
                  ],
                ),Row(
               
                children: <Widget>[
                
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Image.asset('assets/lc_letter.png',
                        height: 150, width: 110),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          KycIcons.check,
                          size: 10,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: Text('Government-issued',
                            style: TextStyle(color: Colors.grey, fontSize:  12)),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          KycIcons.check,
                          size: 10,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: Text('Original full-size, unedited documents',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          KycIcons.check,
                          size: 10,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: Text('Readable well-lit, coloured images',
                            style: TextStyle(color: Colors.grey, fontSize:  12)),
                      ),
                    ]),
                   
                     Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          KycIcons.times,
                          size: 10,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 3),
                        child: Text('No black and white images',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                          'File size must be between 10KB and 512KB in \n..jpg/.jpeg/.png format',
                          style: TextStyle(fontSize: 11.5,fontWeight:FontWeight.w500)),
                          
                  )],
              ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: 12.h,
                    width: 250.w,
                    child: _image == null
                        ? InkWell(
                            onTap: openCamera,
                            child: Card(

                                //radius: 70,
                                child: Icon(KycIcons.add_a_photo,
                                    size: 50, color: Colors.red)))
                        : Container(
                            child: Image.file(_image!, fit: BoxFit.fill),
                          )),
                TextButton(
                    onPressed: RemoveImage,
                    child: Text('X Remove',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ))),
                Container(
                    child: Text(
                        'The image of your LC1 letter will let us know if the LC approved of your business',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ))),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('3 of 5',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/businesscertificate');
                              },
                              child: Icon(
                                KycIcons.navigate_next,
                                color: Colors.red,
                                size: 50,
                              ),
                            )),
                      ],
                    ))
              ],
            ),
          ));
    });
  }

  Future<void> openCamera() async {
    var CameraStatus = await Permission.camera;
    var GalleryStatus = await Permission.storage;
    //print(CameraStatus);
    //print(GalleryStatus);

    if (CameraStatus.isGranted != true) {
      await Permission.camera.request();
    }
    if (GalleryStatus.isGranted != true) {
      Permission.storage.request();
    }
    if (await Permission.camera.isGranted) {
      if (await Permission.storage.isGranted) {
        ShowPicker(context);
      }
    }
  }

  Future<void> galleryImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _image = File(image.path));
    }
    Navigator.pop(context);
  }

  void RemoveImage() {
    setState(() {
      _image = null;
    });
  }

  void ShowPicker(content) {
    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                    leading: Icon(Icons.library_books),
                    title: Text('Gallery'),
                    onTap: galleryImage),
                ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                    onTap: getImage)
              ],
            ),
          );
        });
  }
}
