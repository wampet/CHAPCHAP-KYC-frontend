// // ignore_for_file: prefer_const_constructors, unused_field, non_constant_identifier_names, unrelated_type_equality_checks, await_only_futures

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';



// class CameraActions extends StatefulWidget {
//   const CameraActions({Key? key}) : super(key: key);

//   @override
//   State<CameraActions> createState() => _CameraActionsState();
// }

// class _CameraActionsState extends State<CameraActions> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   Future<void> getImage() async {
//     final image = await _picker.pickImage(source: ImageSource.camera);

//     if (image != null) {
//       setState(() => _image = File(image.path));
//     }
//     Navigator.pop(context);
//   }

// Future<void> openCamera() async {
//     var CameraStatus = await Permission.camera;
//     var GalleryStatus = await Permission.storage;
//     //print(CameraStatus);
//     //print(GalleryStatus);

//     if (CameraStatus.isGranted != true) {
//       await Permission.camera.request();
//     }
//     if (GalleryStatus.isGranted != true) {
//       Permission.storage.request();
//     }
//     if (await Permission.camera.isGranted) {
//       if (await Permission.storage.isGranted) {
//         ShowPicker(context);
//       }
//     }
//   }

//   Future<void> galleryImage() async {
//     final image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() => _image = File(image.path));
//     }
//     Navigator.pop(context);
//   }

//   void RemoveImage() {
//     setState(() {
//       _image = null;
//     });
//   }

//   void ShowPicker(content) {
//     showDialog(
//         context: context,
//         builder: (BuildContext bc) {
//           return AlertDialog(
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                     leading: Icon(Icons.library_books),
//                     title: Text('Gallery'),
//                     onTap: galleryImage),
//                 ListTile(
//                     leading: Icon(Icons.camera),
//                     title: Text('Camera'),
//                     onTap: getImage)
//               ],
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
