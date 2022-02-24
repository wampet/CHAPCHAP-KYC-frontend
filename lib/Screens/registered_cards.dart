// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chapchap_kyc_frontend/Widget/customCardUploads.dart';
import 'package:chapchap_kyc_frontend/Widget/topCardsLabel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../kyc_icons_icons.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: const Text('Registered Customer',
            style: TextStyle(
              color: Colors.white,
            )),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        primary: false,
        // physics: NeverScrollableScrollPhysics(),
        //physics: ClampingScrollPhysics(),
        // height: height,
        // width: width,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: height * 0.324, //300,
                  color: Colors.white,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: height * 0.22, //250,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(45),
                            bottomLeft: Radius.circular(45))),
                    child: TopCardsInstruction(
                      topCardsLabel:
                          'Please complete the steps below to register your Profile',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  // left: width * 0.01, // 30,
                  right: width * 0.01, // 30,
                  child: SizedBox(
                      height: 170,
                      width: 170,
                      child: Lottie.asset('assets/lottieupload.json')),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              child: Column(
                children: [
                     CustomCardUploads(
                navigationFunction: () {
              Navigator.pushNamed(context, '/businessselfie');
                },
                iconUsed: KycIcons.user_2,
                cardLabel: 'Upload your Selfie',
              ),
              CustomCardUploads(
                navigationFunction: () {
              Navigator.pushNamed(context, '/registeredNationalId');
                },
                iconUsed: KycIcons.id_card,
                cardLabel: 'Upload your National ID',
              ),
              CustomCardUploads(
                navigationFunction: () {
              Navigator.pushNamed(context, '/businesslocation');
                },
                iconUsed: KycIcons.store_mall_directory,
                cardLabel: 'Upload your Business Shop',
              ),
              CustomCardUploads(
                navigationFunction: () {
              Navigator.pushNamed(context, '/Lcletter');
                },
                iconUsed: KycIcons.doc_text_inv,
                cardLabel: 'Upload your LC1 Letter(Optional)',
              ),
              CustomCardUploads(
                navigationFunction: () {
              Navigator.pushNamed(context, '/businesscertificate');
                },
                iconUsed: KycIcons.doc_text_inv,
                cardLabel: 'Upload your Registration Certificate',
              ),
               
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text('Registered Company',
//             style: TextStyle(
//               color: Colors.red,
//             )),
//         leading: IconButton(
//           onPressed: () {
//              Navigator.of(context).pop();
//           },
//           icon: const Icon(Icons.arrow_back),
//           color: Colors.red,
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
      
//           child: Column(children: [
//             TopCardsInstruction(topCardsLabel: 'Please complete the steps below to register your Profile',),
            // CustomCardUploads(
            //   navigationFunction: () {
            //     Navigator.pushNamed(context, '/businessselfie');
            //   },
            //   iconUsed: KycIcons.user_2,
            //   cardLabel: 'Upload your Selfie',
            // ),
            // CustomCardUploads(
            //   navigationFunction: () {
            //     Navigator.pushNamed(context, '/registeredNationalId');
            //   },
            //   iconUsed: KycIcons.id_card,
            //   cardLabel: 'Upload your National ID',
            // ),
            // CustomCardUploads(
            //   navigationFunction: () {
            //     Navigator.pushNamed(context, '/businesslocation');
            //   },
            //   iconUsed: KycIcons.store_mall_directory,
            //   cardLabel: 'Upload your Business Shop',
            // ),
            // CustomCardUploads(
            //   navigationFunction: () {
            //     Navigator.pushNamed(context, '/Lcletter');
            //   },
            //   iconUsed: KycIcons.doc_text_inv,
            //   cardLabel: 'Upload your LC1 Letter(Optional)',
            // ),
            // CustomCardUploads(
            //   navigationFunction: () {
            //     Navigator.pushNamed(context, '/businesscertificate');
            //   },
            //   iconUsed: KycIcons.doc_text_inv,
            //   cardLabel: 'Upload your Registration Certificate',
            // ),
             
           
           
//           ]),
//         ),
//       ),
//     );
//   }
// }
