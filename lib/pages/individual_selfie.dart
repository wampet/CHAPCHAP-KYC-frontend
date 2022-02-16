// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../kyc_icons_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class SelfieUpload extends StatefulWidget {
  const SelfieUpload({Key? key}) : super(key: key);

  @override
  State<SelfieUpload> createState() => _SelfieUploadState();
}

class _SelfieUploadState extends State<SelfieUpload> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImage() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    print({"image": image});
    print({"image!.path": image!.path});
    if (image != null) {
      setState(() => _image = image);
      print({"File(_image!.path)": File(_image!.path)});
      // final appDir = await getApplicationDocumentsDirectory();
      // final fileName = path.basename(image.path);
      // final savedImage = await _image!.copy('${appDir.path}/$fileName');
    }
    Navigator.pop(context);
  }

  // File? selectedImage;
  // String? message = "";

  // uploadImage() async {
  //   final request = http.MultipartRequest(
  //       "POST", Uri.parse("https://api.chapchap.dev/kyc/sessions/cc-kyc-sess-19g68kyu7p9b9/upload"));
  //   final headers = {"Content-type": "multipart/form-data"};
  //   request.files.add(http.MultipartFile('selfie',
  //       selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
  //       filename: selectedImage!.path.split("/").last));
  //   request.headers.addAll(headers);
  //   final response = await request.send();
  //   http.Response res = await http.Response.fromStream(response);
  //   final resJson = jsonDecode(res.body);
  //   message = resJson['message'];
  //   setState(() {});
  // }

// Future<String> get _localPath async {
//   final directory = await getApplicationDocumentsDirectory();

//   return directory.path;
// }
// Future<String> get _localFile(filename) async {
//   final path = await _localPath;

//   return File;
// }

  Future<String> uploadImage(filename) async {
    String? username = dotenv.env['username'];
    String? password = dotenv.env['password'];
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "https://api.chapchap.dev/kyc/sessions/cc-kyc-sess-19g67kzpmf1h6/upload"));
    request.headers.addAll({
      "Authorization": basicAuth,
      // "content-type": "multipart/form-data"
    });
    request.fields['uploadType'] = "selfie";
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    print({'req':request});
    var res = await request.send();
    print({'res': res.statusCode});
    return res.stream.bytesToString();
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
        body: Container(
          margin: const EdgeInsets.fromLTRB(15.0, 15, 15, 2),
          width: 90.w,
          height: 90.h,
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.asset('assets/kyc_selfie.png',
                              height: 90, width: 80),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            KycIcons.check,
                            size: 10,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(4, 0, 0, 5),
                          child: Text(
                              'Take a selfie of yourself with a neutral expression',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 11.5)),
                        ),
                      ]),
                      Row(children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            KycIcons.check,
                            size: 10,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(4, 0, 0, 5),
                          child: Text(
                              'Face should be visible, centered and your eyes open',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 11.5)),
                        ),
                      ]),
                      Row(children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            KycIcons.check,
                            size: 10,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(4, 0, 0, 5),
                          child: Text(
                              'Do not crop your ID or use screenshots of your ID',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 11.5)),
                        ),
                      ]),
                      Row(children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            KycIcons.times,
                            size: 10,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(4, 0, 0, 5),
                          child: Text('No hats/beauty images/filters/headgear',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 11)),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                          child: Image.file(File(_image!.path),
                              fit: BoxFit.cover, height: 162, width: 161))),
              Row(
                children: [
                  TextButton(
                      onPressed: RemoveImage,
                      child: Text('X Remove',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))),
                  // selectedImage == null
                  // ? Text('Select Image')
                  // : Image.file(selectedImage!),
                  _image == null
                      ? Text('upload file')
                      : TextButton(
                          onPressed: () => {uploadImage(_image!.path)},
                          child: Text("Upload"),
                        ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 20),
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
                      margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/individualNationalId');
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
      setState(() => _image = image);
      // var res = await uploadImage(file.path, widget.url);
      // setState(() {
      //   state = res;
      //   print(res);
      // });
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
