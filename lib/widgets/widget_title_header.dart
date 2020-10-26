import 'package:flutter/material.dart';

class WidgetTitleHeader extends StatelessWidget{

  final String title;

  WidgetTitleHeader({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {

    return Text(
      title,
      style: TextStyle(
        fontFamily: "Lato",
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }



}