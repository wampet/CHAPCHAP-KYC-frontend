// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription(
      {required this.descriptionLabel,
      required this.describeIcon,
      required this.iconColor});
  final IconData describeIcon;
  final String descriptionLabel;
  final Color iconColor;

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: <Widget>[
//       Container(
//         padding: const EdgeInsets.all(3),
//         child: Icon(
//           describeIcon,
//           size: 20,
//           color: iconColor,
//         ),
//       ),
//       SizedBox(width: 8,),
//       Text(descriptionLabel,
//           style: TextStyle(color: Colors.grey, fontSize: 15)),
//     ]);
//   }
// }
  @override
  Widget build(BuildContext context) {
    return ListTile(
       visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      leading: Icon(
        describeIcon,
        size: 20,
        color: iconColor,
      ),
      title: Transform(
        transform: Matrix4.translationValues(-20, 0.0, 0.0),
        child: Text(descriptionLabel,
            style: TextStyle(color: Colors.grey[600], fontSize: 15.5)),
      ),
    );
  }
}
