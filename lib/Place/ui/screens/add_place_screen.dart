import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_trips_flutter_app/widgets/button_back.dart';
import 'package:my_trips_flutter_app/widgets/gradient_back.dart';

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

    return Scaffold(

      body: Stack(
        children: [
          GradientBack(height: 300.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 25.0,
                  left: 5.0,
                ),
                child: ButtonBack(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}