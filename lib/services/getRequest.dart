// ignore_for_file: unnecessary_this

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<Upload> fetchRequest() async {
  final response = await http.get(
    Uri.parse('https://api.chapchap.dev/kyc/sessions/cc-kyc-sess-19g68kylj1u9l'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: 'cc-kyc-sess-19g68kylj1u9l',
    },
  );
  final responseJson = jsonDecode(response.body);

  return Upload.fromJson(responseJson);
}

class Upload {
  String? sId;
  String? uploadType;
  String? fileSize;
  String? fileType;
  String? createdAt;

  Upload(
      {this.sId,
      this.uploadType,
      this.fileSize,
      this.fileType,
      this.createdAt});

  Upload.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uploadType = json['uploadType'];
    fileSize = json['fileSize'];
    fileType = json['fileType'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uploadType'] = this.uploadType;
    data['fileSize'] = this.fileSize;
    data['fileType'] = this.fileType;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

