import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_trips_flutter_app/widgets/button_back.dart';
import 'package:my_trips_flutter_app/widgets/gradient_back.dart';
import 'package:my_trips_flutter_app/widgets/widget_title_header.dart';

class AddPlaceScreen extends StatefulWidget{

  File image;

  AddPlaceScreen ({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPlaceScreen();
  }

}

class _AddPlaceScreen extends State<AddPlaceScreen>{

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Stack(
        children: [
          GradientBack(height: 300.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 25.0,
                  left: 3.0,
                ),
                child: ButtonBack(),
              ),
              Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 50.0,
                      left: 20.0,
                      right: 5.0,
                    ),
                    width: screenWidth,
                    child: WidgetTitleHeader(title: "Add a new place"),
                  )
              )
            ],
          ),
        ],
      ),
    );
  }
}