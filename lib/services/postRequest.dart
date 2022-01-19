// ignore_for_file: unnecessary_this

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Customer> postSession() async {
  final response = await http.post(
    Uri.parse('https://api.chapchap.dev/kyc/sessions/'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "customer": {
        "firstName": "John",
        "middleName": "Telemetry",
        "lastName": "Doe",
        "dob": "1986-01-01",
        "identifier": "256-74800000",
        "country": "UG",
        "gender": "M",
        "phoneNumber": "256772123456",
        "idNumber": "256-74800000",
        "role": "merchant"
      }
    }),
  );
  
  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return Customer.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    throw Exception('The sytem was unable to find the specified resource');
  }
}

class Customer {
  String? firstName;
  String? middleName;
  String? lastName;
  String? dob;
  String? identifier;
  String? country;
  String? gender;
  String? phoneNumber;
  String? idNumber;
  String? role;

  Customer(
      {this.firstName,
      this.middleName,
      this.lastName,
      this.dob,
      this.identifier,
      this.country,
      this.gender,
      this.phoneNumber,
      this.idNumber,
      this.role});

  Customer.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    dob = json['dob'];
    identifier = json['identifier'];
    country = json['country'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    idNumber = json['idNumber'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['dob'] = this.dob;
    data['identifier'] = this.identifier;
    data['country'] = this.country;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['idNumber'] = this.idNumber;
    data['role'] = this.role;
    return data;
  }
}
