import 'dart:convert';

import 'package:flutter/cupertino.dart';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
    String sessionId;
    String status;
    String tz;
    DateTime createdAt;
    DateTime expiresAt;
    List<dynamic> uploads;


    Customer({
        required this.sessionId,
        required this.status,
        required this.tz,
        required this.createdAt,
        required this.expiresAt,
        required this.uploads,

    });


    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        sessionId: json["sessionId"],
        status: json["status"],
        tz: json["tz"],
        createdAt: DateTime.parse(json["createdAt"]),
        expiresAt: DateTime.parse(json["expiresAt"]),
        uploads: List<dynamic>.from(json["uploads"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "sessionId": sessionId,
        "status": status,
        "tz": tz,
        "createdAt": createdAt.toIso8601String(),
        "expiresAt": expiresAt.toIso8601String(),
        "uploads": List<dynamic>.from(uploads.map((x) => x)),

    };
}
