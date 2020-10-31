import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double width;
  final double left;
  final VoidCallback onPressed;
  final String pathImage;
  final IconData iconWithBorder;
  final IconData iconFilled;

  CardImageWithFabIcon({
    Key key,
    @required this.pathImage,
    @required this.height,
    @required this.width,
    @required this.left,
    @required this.iconFilled,
    @required this.iconWithBorder,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: left,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            //image: AssetImage(pathImage),
            image: pathImage.contains('assets') ? AssetImage(pathImage) : new FileImage(new File(pathImage)),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15.0,
              offset: Offset(0.0, 7.0),
            )
          ]),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconWithBorder: iconWithBorder,
          iconFilled: iconFilled,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
