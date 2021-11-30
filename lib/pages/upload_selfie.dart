// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BusinessSelfie extends StatefulWidget {
  const BusinessSelfie({Key? key}) : super(key: key);

  @override
  _BusinessSelfieState createState() => _BusinessSelfieState();
}

class _BusinessSelfieState extends State<BusinessSelfie>  {
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: const StepProgressIndicator(
                            totalSteps: 4,
                            currentStep: 1,
                            selectedColor: Colors.red,
                            unselectedColor: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: const Text(
                          'Take your selfie',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 10, 20),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/kyc_selfie.png',
                          height: 50, width: 40),
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: Icon(
                                KycIcons.check,
                                size: 7,
                                color: Colors.green,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(4, 0, 0, 3),
                              child: Text(
                                  'Take a selfie of yourself with a neutral expression',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9)),
                            ),
                          ]),
                          Row(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: Icon(
                                KycIcons.check,
                                size: 7,
                                color: Colors.green,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(4, 0, 0, 3),
                              child: Text(
                                  'Face should be visible, centered and your eyes open',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9)),
                            ),
                          ]),
                          Row(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: Icon(
                                KycIcons.check,
                                size: 7,
                                color: Colors.green,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(4, 0, 0, 3),
                              child: Text(
                                  'Do not crop your ID or use screenshots of your ID',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9)),
                            ),
                          ]),
                          Row(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: Icon(
                                KycIcons.times,
                                size: 7,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(4, 0, 0, 3),
                              child: Text(
                                  'No hats/beauty images/filters/headgear',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9)),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      child: _image == null
                          ? InkWell(
                              onTap: openCamera,
                              child: Container(
                  
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 70,
                                      child: Icon(KycIcons.add_a_photo,
                                          size: 80, color: Colors.red))))
                          : ClipOval(
                              child: Image.file(_image!,fit: BoxFit.cover,height: 25.h, 
                  width: 180
                  )
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
                    margin: const EdgeInsets.fromLTRB(20, 60, 20, 50),
                    child: const Text(
                      'Your Image will help us identify who you are',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: const Text(
                            '1 of 5',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/registeredNationalId');
                              },
                              child: Icon(
                                KycIcons.navigate_next,
                                color: Colors.red,
                                size: 50,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              )),
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
