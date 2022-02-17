// // ignore_for_file: unnecessary_this

// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:chapchap_kyc_frontend/models/postRequestModel.dart';
// import 'package:http/http.dart' as http;

// Future<Customer> fetchRequest() async {
//   final response = await http.get(
//     Uri.parse('https://api.chapchap.dev/kyc/sessions/cc-kyc-sess-19g68kylj1u9l'),
//     // Send authorization headers to the backend.
//     headers: {
//       HttpHeaders.authorizationHeader: 'a3ljdXNlcjpaUzBaRTBYRFdnckhCN25vcWE4bjdnMFZsSkZYN243TQ==',
//     },
//   );
//   final responseJson = jsonDecode(response.body);

//   return responseJson;
// }

// // import 'package:dio/dio.dart';
// // void fetchRequest() async {
// //   try {
// //     var response = await Dio().get('https://api.chapchap.dev/kyc/sessions');
// //     print(response);
// //   } catch (e) {
// //     print(e);
// //   }
// // }