// import 'package:chapchap_kyc_frontend/models/postRequestModel.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// Future<Customer> createSession(
//   String firstName,
//   String middleName,
//   String lastName,
//   String dob,
//   String identifier,
//   String country,
//   String gender,
//   String phoneNumber,
//   String idNumber,
//   String role,
// ) async {
//   String username = 'kycuser';
//   String password = 'ZS0ZE0XDWgrHB7noqa8n7g0VlJFX7n7M';
//   String basicAuth =
//       'Basic ' + base64Encode(utf8.encode('$username:$password'));
//   const String apiUrl = 'https://api.chapchap.dev/kyc/sessions/';
//   try {
//     final response = await http.get(Uri.parse(apiUrl),
//         headers: {
//           'authorization': basicAuth,
//           "Accept": "application/json",
//           "content-type": "application/json"
//         },
//        );
//     if (response.statusCode == 200) {
//       final String respString = response.body;
//       print(respString);
//       return customerFromJson(respString);
//     } else {
//       print(response.statusCode.toString());
//       throw Exception(
//           'Failed load data with status code ${response.statusCode}');
//     }
//   } catch (e) {
//     print(e);
//     throw e;
//   }
// }

// class _HomeState extends State<Home> {
//   Customer? _user;

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController jobController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Fooderlich',
//             style: Theme.of(context).textTheme.headline6,
//           ),
//         ),
//         body: Container(
//           child: Column(
//             children: [
       
//               const SizedBox(
//                 height: 32,
//               ),
//               _user == null ? Container() : Text('this is ${_user?.sessionId}')
//             ],
//           ),
//         ),

//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//      const String firstName = "LUBANGAAFAFFA";
//             final String middleName = "DoeDNDAFDAFA";
//             final String lastName = "Tele";
//             const String dob = "1986-01-05";
//             const String identifier = "256-74803012";
//             const String country = "KE";
//             const String gender = "M";
//             const String phoneNumber = "256772123456";
//             const String idNumber = "256-74800002";
//             const String role = "merchant";

//             final Customer user = await createSession(
//                 firstName,
//                 middleName,
//                 lastName,
//                 dob,
//                 identifier,
//                 country,
//                 gender,
//                 phoneNumber,
//                 idNumber,
//                 role);
//             print(user);
//             setState(() {
//               _user = user;
//             });
//           },
//         ));
//   }
// }
