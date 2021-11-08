

import 'package:chapchap_kyc_frontend/kyc_icons_icons.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Color iconColor;
  final double iconSize;
  final Color cardColor;
  final Color innerCardColor;
  final String title;
  final IconData innerIcon;
  final TextStyle style;

  final void Function()? onTap;

  const CustomCard({
    Key? key,
    this.iconColor = Colors.red,
    this.iconSize = 20.0,
    this.cardColor = Colors.red,
    this.innerCardColor = Colors.white,
    this.title = 'Upload your selfie',
    this.style = const TextStyle(color: Colors.white, fontSize: 16),
    this.innerIcon =  KycIcons.add_a_photo,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 1),
      color: widget.cardColor,
      child: InkWell(
        child: ListTile(
          leading: Card(
            color: widget.innerCardColor,
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                KycIcons.add_a_photo,
                size: widget.iconSize,
                color: widget.iconColor,
              ),
            ),
          ),
          title: Text(widget.title, style: widget.style),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}