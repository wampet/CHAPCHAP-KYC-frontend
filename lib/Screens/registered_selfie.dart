// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:chapchap_kyc_frontend/Widget/bottomNavigation.dart';
import 'package:chapchap_kyc_frontend/Widget/topSectionHeading.dart';
import 'package:chapchap_kyc_frontend/Widget/uploadDescription.dart';
import 'package:flutter/material.dart';
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

///image upload
// Future<String> uploadImage(filepath, url) async {
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.files.add(await http.MultipartFile.fromPath('image', filepath));
//     var res = await request.send();
//     return res.reasonPhrase;
//   }
class _BusinessSelfieState extends State<BusinessSelfie> {
  File? _image;
  //new one
  // final String uploadUrl = 'https://api.imgur.com/3/upload';
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
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: const StepProgressIndicator(
                          totalSteps: 4,
                          currentStep: 1,
                          selectedColor: Colors.red,
                          unselectedColor: Colors.grey),
                    ),
                  ],
                ),
                TopHeading(
                  instructionLabel: 'Take your selfie',
                ),
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          'Example',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                 Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        CustomDescription(
                          describeIcon: KycIcons.check,
                          descriptionLabel:
                              'Take a selfie of yourself with a neutral expression',
                          iconColor: Colors.green,
                        ),
                        CustomDescription(
                          describeIcon: KycIcons.check,
                          descriptionLabel:
                              'Face should be visible, centered and your eyes open',
                          iconColor: Colors.green,
                        ),
                        CustomDescription(
                          describeIcon: KycIcons.check,
                          iconColor: Colors.green,
                          descriptionLabel:
                              'Take a selfie of yourself with a neutral expression',
                        ),
                        CustomDescription(
                          describeIcon: KycIcons.times,
                          iconColor: Colors.red,
                          descriptionLabel:
                              'No hats/beauty images/filters/headgear',
                        ),
                      ],
                    ),
               
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                    child: _image == null
                        ? InkWell(
                            onTap: openCamera,
                            child: Container(
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 70,
                                    child: Icon(KycIcons.add_a_photo,
                                        size: 50, color: Colors.red))))
                        : ClipOval(
                            child: Image.file(_image!,
                                fit: BoxFit.cover, height: 162, width: 161))),
                TextButton(
                    onPressed: RemoveImage,
                    child: Text('X Remove',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ))),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'Your Image will help us identify who you are',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                BottomNavigation(
                  navigationLabel: '1 of 5',
                  bottomNavigationFunction: () {
                    Navigator.pushNamed(context, '/registeredNationalId');
                  },
                ),
              ],
            ),
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
