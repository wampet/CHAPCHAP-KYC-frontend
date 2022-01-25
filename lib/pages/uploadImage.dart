// ignore: file_names
// ignore: file_names
// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  late File _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  upload(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://localhost:3000/assets");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  bool isloaded = false;
  var result;
  fetch() async {
    var response = await http.get(Uri.parse('http://localhost:3000/uploads'));
    result = jsonDecode(response.body);
    print(result[0]['image']);
    setState(() {
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    fetch();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text("Select an image"),
          FlatButton.icon(
              onPressed: () async => await getImage(),
              icon: Icon(Icons.upload_file),
              label: Text("Browse")),
          const SizedBox(
            height: 20,
          ),
          FlatButton.icon(
              onPressed: () => upload(_image),
              icon: Icon(Icons.upload_rounded),
              label: Text("Upload now")),
          isloaded
              ? Image.network('http://localhost:3000/${result[0]['image']}')
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}