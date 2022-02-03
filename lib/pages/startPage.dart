import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../services/userInfoModel.dart';
import 'dart:convert';
import 'package:sizer/sizer.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

late Future<Customer> getSession;

Future<Customer> createSession(
  String firstName,
  String middleName,
  String lastName,
  String dob,
  String identifier,
  String country,
  String gender,
  String phoneNumber,
  String idNumber,
  String role,
) async {
  String? username = dotenv.env['username'];
  String? password = dotenv.env['password'];
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  final String? apiUrl = dotenv.env['apiUrl'];
  try {
    final response = await http.post(Uri.parse(apiUrl!),
        headers: {
          'authorization': basicAuth,
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonEncode({
          "customer": {
            "firstName": firstName,
            "middleName": middleName,
            "lastName": lastName,
            "dob": dob,
            "identifier": identifier,
            "country": country,
            "gender": gender,
            "phoneNumber": phoneNumber,
            "idNumber": idNumber,
            "role": role,
          }
        }));
    if (response.statusCode == 200) {
      final String respString = response.body;
      print(respString);
      return customerFromJson(respString);
    } else {
      print(response.statusCode.toString());
      throw Exception(
          'Failed load data with status code ${response.statusCode}');
    }
  } catch (e) {
    print(e);
    throw e;
  }
}

// Future<Customer> getSessions() async {
//   final String? apiUrl = DotEnv().env['apiUrl'];
//   try {
//     final response = await http.get(
//       Uri.parse('${apiUrl}'),
//       headers: {
//         'authorization': 'Basic ' +
//             base64Encode(
//                 utf8.encode('kycuser:ZS0ZE0XDWgrHB7noqa8n7g0VlJFX7n7M')),
//         "Accept": "application/json",
//         "content-type": "application/json"
//       },
//     );

//     if (response.statusCode == 200) {
//       final responseJson = jsonDecode(response.body);
//       print(responseJson);
//       return Customer.fromJson(responseJson);
//     } else {
//       throw Exception(
//           'Failed load data with status code ${response.statusCode}');
//     }
//   } catch (e) {
//     print(e);
//     throw e;
//   }
// }

class _StartPageState extends State<StartPage> {
  late Future<Customer> newSession;

  // @override
  // void initState() {
  //   super.initState();
  //   // newSession = getSessions();
  // }

  Customer? _user;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          appBar: AppBar(
            title: Text('ChapChap KYC Verification',
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
              children: [
                // Center(
                //   child: FutureBuilder<Customer>(
                //     future: newSession,
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return Text(snapshot.data!.sessionId);
                //       } else if (snapshot.hasError) {
                //         return Text('${snapshot.error}');
                //       }

                //       // By default, show a loading spinner.
                //       return const CircularProgressIndicator();
                //     },
                //   ),
                // ),
                ElevatedButton(
                    // style: butt,
                    child: Center(child: Text('Get Started')),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/individualcards');

                      const String firstName = "John";
                      final String middleName = "Doe";
                      final String lastName = "Telemetry";
                      const String dob = "1986-01-01";
                      const String identifier = "256-74100009";
                      const String country = "UG";
                      const String gender = "M";
                      const String phoneNumber = "256772123456";
                      const String idNumber = "256-74800000";
                      const String role = "merchant";

                      final Customer user = await createSession(
                          firstName,
                          middleName,
                          lastName,
                          dob,
                          identifier,
                          country,
                          gender,
                          phoneNumber,
                          idNumber,
                          role);
                      print(user);
                      setState(() {
                        _user = user;
                      });
                    }),
                SizedBox(
                  height: 32,
                ),
                _user == null
                    ? Container()
                    : Text('this is ${_user?.sessionId}')
              ],
            ),
          ));
    });
  }
}
