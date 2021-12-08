import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:io';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class Back_RegisteredNationalID extends StatefulWidget {
  const Back_RegisteredNationalID({Key? key}) : super(key: key);

  @override
  State<Back_RegisteredNationalID> createState() => _Back_RegisteredNationalIDState();
}

class _Back_RegisteredNationalIDState extends State<Back_RegisteredNationalID> {
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
          backgroundColor: Colors.white70,
          title: const Text(
            "Registered Company",
            style: TextStyle(color: Colors.red),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(15.0, 15, 15, 10),
          width: 90.w,
          height: 80.h,
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: const StepProgressIndicator(
                        totalSteps: 5,
                        currentStep: 2,
                        selectedColor: Colors.red,
                        unselectedColor: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: const Text(
                      'Upload your National ID ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 20, 10, 0),
                    child: const Text(
                      'pending',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0) ,
                          child: Text('Example',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),)
                      ),
                ],
              ),
              Row(
               
                children: <Widget>[
                
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Image.asset('assets/kyc_frontid.png',
                        height: 100, width: 110),
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
                        child: Text('No edited or expired documents',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.fromLTRB(80, 50, 80, 50),
                    //This is where the camera implementaion will take place from
                    child: _image == null
                        ? InkWell(
                            onTap: openCamera,
                            child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Icon(
                                      KycIcons.id_card,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 0),
                                        child: Text('Front of document',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey[900]))),
                                  ],
                                )),
                          )
                        : Container(
                            height: 70,
                            child: Image.file(_image!, fit: BoxFit.cover)),
                  ),
                  TextButton(
                      onPressed: RemoveImage,
                      child: Text('X Remove',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )))
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '2 of 5',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/Lcletter');
                      },
                      child: Icon(
                        KycIcons.navigate_next,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
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
