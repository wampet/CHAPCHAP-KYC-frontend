// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:chapchap_kyc_frontend/Widget/bottomNavigation.dart';
import 'package:chapchap_kyc_frontend/Widget/topSectionHeading.dart';
import 'package:chapchap_kyc_frontend/Widget/uploadDescription.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
//import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class IndividualLCletter extends StatefulWidget {
  const IndividualLCletter({Key? key}) : super(key: key);

  @override
  State<IndividualLCletter> createState() => _IndividualLCletterState();
}

class _IndividualLCletterState extends State<IndividualLCletter> {
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
              "Individual Owner",
              style: TextStyle(color: Colors.red),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(8.0),
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
                TopHeading(
                  instructionLabel: 'Upload your LC1 \nLetter(Optional) ',
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                      child: Image.asset('assets/lc_letter.png',
                          height: 150, width: 110),
                    )
                  ],
                ),      Column(
                // ignore: prefer_const_literals_to_create_immutables
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
                BottomNavigation(
                  navigationLabel: '4 of 4',
                  bottomNavigationFunction: () {
                    Navigator.pushNamed(context, '/finalScreen');
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
