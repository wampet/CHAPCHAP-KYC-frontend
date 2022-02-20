// ignore_for_file: prefer_const_constructors

import 'package:chapchap_kyc_frontend/Widget/bottomNavigation.dart';
import 'package:chapchap_kyc_frontend/Widget/topSectionHeading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class IndividualLocation extends StatefulWidget {
  const IndividualLocation({Key? key}) : super(key: key);

  @override
  _IndividualLocationState createState() => _IndividualLocationState();
}

class _IndividualLocationState extends State<IndividualLocation> {
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
            title: const Text(
              'Individual Owner',
              style: TextStyle(color: Colors.red),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(KycIcons.arrow_back),
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(15.0, 15, 15, 10),
            width: 90.w,
            height: 80.h,
            child: Column(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: const StepProgressIndicator(
                        totalSteps: 4,
                        currentStep: 3,
                        selectedColor: Colors.red,
                        unselectedColor: Colors.grey),
                  ),
                ]),
                TopHeading(
                  instructionLabel: 'Upload your \nBusiness Shop',
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    height: 32.h,
                    width: 250.w,
                    child: _image == null
                        ? InkWell(
                            onTap: openCamera,
                            child: Card(

                                //radius: 70,
                                child: Icon(KycIcons.add_a_photo,
                                    size: 50, color: Colors.red)))
                        : Container(
                            child: Image.file(
                            _image!,
                            height: 32.h,
                            fit: BoxFit.cover,
                            width: 250,
                          ))),
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
                        'The image of your shop will help us identify where your shop is located',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ))),
                BottomNavigation(
                  navigationLabel: '3 of 4',
                  bottomNavigationFunction: () {
                    Navigator.pushNamed(context, '/optionalletter');
                  },
                ),
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
