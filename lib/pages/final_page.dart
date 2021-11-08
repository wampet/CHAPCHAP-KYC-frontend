import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';





class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 90,
          ),
          const SizedBox(
            height: 60,
          ),
          const Icon(
            KycIcons.check_circle,
            size: 250,
            color: Colors.red,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: const Text(
                  'Successfully  Uploaded',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(35, 10, 30, 10),
                child: const Text(
                  ' Your documents have been submitted.\n Please allow us verify your submission.\n   We will notify you once we are done',
                  style: TextStyle(color: Colors.red, fontSize: 13.8),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
