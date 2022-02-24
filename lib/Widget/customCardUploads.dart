// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';

class CustomCardUploads extends StatelessWidget {
  CustomCardUploads({
    required this.navigationFunction,
    required this.iconUsed,
    required this.cardLabel,
  });

  final VoidCallback navigationFunction;
  final IconData iconUsed;
  final String cardLabel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigationFunction,
      child: Container(
        height: 70,
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: kElevationToShadow[3],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(
              iconUsed,
              size: 28,
              color: Colors.red,
            ),
            title: Text(cardLabel,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 19,
                    fontWeight: FontWeight.w400)),
            trailing: Icon(
              KycIcons.navigate_next,
              color: Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }
}



//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: navigationFunction,
//       child: Expanded(
//         child: Container(
//           height: 60,
//           margin: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: kElevationToShadow[3],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Icon(
//                 iconUsed,
//                 size: 28,
//                 color: Colors.red,
//               ),
//               Text(cardLabel,
//                   style: TextStyle(color: Colors.grey[700], fontSize: 19)),
//                   Icon(KycIcons.navigate_next,color: Colors.grey[700],)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
