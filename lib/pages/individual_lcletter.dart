// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'dart:convert';
import 'dart:ui';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
//import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class IndividualLCletter extends StatefulWidget {
  const IndividualLCletter({Key? key}) : super(key: key);

  @override
  State<IndividualLCletter> createState() => _IndividualLCletterState();
}

class _IndividualLCletterState extends State<IndividualLCletter> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImage() async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    print({"image": image!.name});
    if (image != null) {
      setState(() =>
          // _image = image;
          _image = File(image.path));
    }
    print({"_image": _image});
    print({"image.path": image.path});
    Navigator.pop(context);
  }

  Future<String> uploadImage(filename) async {
    String? username = dotenv.env['username'];
    String? password = dotenv.env['password'];
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "https://api.chapchap.dev/kyc/sessions/cc-kyc-sess-19g67kzlm0tgl/upload"));
    request.headers.addAll({
      "Authorization": 
      basicAuth, 
    //   // "Accept": "multipart/form-data",       
    //  "content-type": "application/json"
    });
    request.fields['uploadType'] = "selfie";
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    return res.stream.bytesToString();
  }
  // Future<void> galleryImage() async {
  //   var image = await _picker.pickImage(source: ImageSource.gallery);
  //   print({"file.path", image?.path});
  //   if (image != null) {
  //     setState(() => _image = image);
  //   }
  // }
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
              icon: const Icon(Icons.arrow_back),
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(15.0, 15, 15, 10),
            width: 90.w,
            height: 80.h,
            child: Column(children: [
              Container(
                child: _image == null
                    ? ElevatedButton(
                        onPressed: getImage, child: Text('No image selected'))
                    : ClipOval(
                        child: Image.file(_image!,
                            fit: BoxFit.cover, height: 162, width: 161)),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () async {
                      var file =
                          await _picker.pickImage(source: ImageSource.camera);
                      var res = await uploadImage(file!.path);
                      print({'res': res});
                    },
                    child: Text("press")),
              )
            ]),
            // ElevatedButton(onPressed: getImage, child: Text('get image')),

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            //       child: const StepProgressIndicator(
            //           totalSteps: 4,
            //           currentStep: 4,
            //           selectedColor: Colors.red,
            //           unselectedColor: Colors.grey),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Text('Upload your LC1 \nLetter(Optional) ',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 17,
            //           fontWeight: FontWeight.bold,
            //         )),
            //     Text('pending',
            //         style: TextStyle(
            //             color: Colors.orange,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 9))
            //   ],
            // ),
            // Container(
            //     margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            //     height: 32.h,
            //     width: 250.w,
            //     child: _image == null
            //         ? InkWell(
            //             onTap: openCamera,
            //             child: Card(

            //                 //radius: 70,
            //                 child: Icon(KycIcons.add_a_photo,
            //                     size: 50, color: Colors.red)))
            //         : Container(
            //             child: Image.file(_image!, fit: BoxFit.fill),
            //           )),
            // TextButton(
            //     onPressed: RemoveImage,
            //     child: Text('X Remove',
            //         style: TextStyle(
            //           color: Colors.red,
            //           fontSize: 15,
            //           fontWeight: FontWeight.bold,
            //         ))),
            // Container(
            //   child: Text(
            //       'The Image of your LC1 letter will let us know if the LC approved of your business',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 15,
            //       )),
            // ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text(
            //         '4 of 4',
            //         style: TextStyle(
            //           color: Colors.red,
            //           fontSize: 15,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Container(
            //           padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            //           child: InkWell(
            //             onTap: () {
            //               Navigator.pushNamed(context, '/finalScreen');
            //             },
            //             child: Icon(
            //               KycIcons.navigate_next,
            //               color: Colors.red,
            //               size: 50,
            //             ),
            //           )),
            //     ],
            //   ),
            // )
            // ]))
          ));
    });
  }

  // Future<void> openCamera() async {
  //   var CameraStatus = await Permission.camera;
  //   var GalleryStatus = await Permission.storage;
  //   //print(CameraStatus);
  //   //print(GalleryStatus);

  //   if (CameraStatus.isGranted != true) {
  //     await Permission.camera.request();
  //   }
  //   if (GalleryStatus.isGranted != true) {
  //     Permission.storage.request();
  //   }
  //   if (await Permission.camera.isGranted) {
  //     if (await Permission.storage.isGranted) {
  //       ShowPicker(context);
  //     }
  //   }
  // }

  // Future<String> getFilePath(imgName) async {
  //   Directory appDocumentsDirectory =
  //       await getApplicationDocumentsDirectory(); // 1
  //   String appDocumentsPath = appDocumentsDirectory.path; // 2
  //   String filePath = '$appDocumentsPath/' '$imgName'; // 3
  //   print(filePath);

  //   return filePath;
  // }

  // String? imgName = image?.name;
  // Directory appDocumentsDirectory =
  //     await getApplicationDocumentsDirectory(); // 1
  // String appDocumentsPath = appDocumentsDirectory.path; // 2
  // String filePath = '$appDocumentsPath/' '$imgName'; // 3
  //   print(filePath);

  //   return filePath;
  // String imgName = getFilePath(image?.name);
  //   var res = await uploadImage(image?.path);
  //   // print(imgName);
  //   print(res);
  //   Navigator.pop(context);
  // }



  // uploadImage(image)

  // void RemoveImage() {
  //   setState(() {
  //     _image = null;
  //   });
  // }

  // void ShowPicker(content) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return AlertDialog(
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               // ListTile(
  //               //     leading: Icon(Icons.library_books),
  //               //     title: Text('Gallery'),
  //               //     onTap: galleryImage),
  //               ListTile(
  //                   leading: Icon(Icons.camera),
  //                   title: Text('Camera'),
  //                   onTap: getImage)
  //             ],
  //           ),
  //         );
  //       });
  // }
}
