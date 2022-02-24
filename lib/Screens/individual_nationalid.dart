// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:chapchap_kyc_frontend/Widget/bottomNavigation.dart';
import 'package:chapchap_kyc_frontend/Widget/topSectionHeading.dart';
import 'package:chapchap_kyc_frontend/Widget/uploadDescription.dart';
import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class National_id extends StatefulWidget {
  const National_id({Key? key}) : super(key: key);

  @override
  State<National_id> createState() => _National_idState();
}

class _National_idState extends State<National_id> {
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
            "Individual Owner",
            style: TextStyle(color: Colors.red),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: const StepProgressIndicator(
                        totalSteps: 4,
                        currentStep: 2,
                        selectedColor: Colors.red,
                        unselectedColor: Colors.grey),
                  ),
                ],
              ),
              TopHeading(
                instructionLabel: 'Upload your National ID ',
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        'Example',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
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
              Column(
                children: <Widget>[
                  CustomDescription(
                    describeIcon: KycIcons.check,
                    descriptionLabel: 'Government-issued',
                    iconColor: Colors.green,
                  ),
                  CustomDescription(
                    describeIcon: KycIcons.check,
                    descriptionLabel: 'Original full-size, unedited documents',
                    iconColor: Colors.green,
                  ),
                  CustomDescription(
                    describeIcon: KycIcons.check,
                    iconColor: Colors.green,
                    descriptionLabel: 'Readable well-lit, coloured images',
                  ),
                  CustomDescription(
                    describeIcon: KycIcons.times,
                    iconColor: Colors.red,
                    descriptionLabel: 'No edited or expired documents',
                  ),
                  CustomDescription(
                    describeIcon: KycIcons.times,
                    iconColor: Colors.red,
                    descriptionLabel:
                        'No black and white images',
                  ),
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                        'File size must be between 10KB and 512KB in \n..jpg/.jpeg/.png format',
                        style: TextStyle(
                            fontSize: 11.5, fontWeight: FontWeight.w500)),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Colors.white,
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
                            height: 75,
                            width: 180,
                            child: Image.file(_image!, fit: BoxFit.cover)),
                  ),
                  TextButton(
                      onPressed: RemoveImage,
                      child: Text('X Remove',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))),
                  Text('Your upload will help us identify who you are'),
                ],
              ),
              BottomNavigation(
                navigationLabel: '2 of 4',
                bottomNavigationFunction: () {
                  Navigator.pushNamed(context, '/individuallocation');
                },
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
