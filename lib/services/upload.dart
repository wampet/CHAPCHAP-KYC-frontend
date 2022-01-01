import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> createSession() async {
  try {
    const url = "https://services.chapchap.dev/kyc-service/v1/sessions/";
    final response = await http.post(Uri.parse(url),
        body: json.encode({
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
        }));
      // http.MultipartRequest
    final res_data = json.decode(response.body);
    print(res_data);
  } catch (err) {
    print(err);
    throw err;
  }
}



