// import 'package:chapchap_kyc_frontend/services/networking.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';
// const apiKey = 'e72ca729af228beabd5d20e3b7749713';
// const chapChapKycGetURL = 'https://api.chapchap.dev/kyc/sessions/cc-kyc-sess-19g68kyu5mujl';

// class WeatherModel {
//   Future<dynamic> getSession(
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
  
//   )  async {
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
//       return SessionFromJson(respString);
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
//   //async {
//   //   NetworkHelper networkHelper = NetworkHelper(
//   //       '$chapChapKycGetURL?q=$cityName&appid=$apiKey&units=metric');

//   //   var weatherData = await networkHelper.getData();
//   //   return weatherData;
//   // }
