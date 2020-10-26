import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_trips_flutter_app/widgets/button_back.dart';
import 'package:my_trips_flutter_app/widgets/gradient_back.dart';
import 'package:my_trips_flutter_app/widgets/widget_textfield.dart';
import 'package:my_trips_flutter_app/widgets/widget_title_header.dart';

class AddPlaceScreen extends StatefulWidget{

  File image;

  AddPlaceScreen ({Key key, this.image});


  @override
  State<StatefulWidget> createState() {

    return _AddPlaceScreen();
  }

}

class _AddPlaceScreen extends State<AddPlaceScreen>{

  @override
  Widget build(BuildContext context) {

   final _controllerTitlePlace = TextEditingController();
   final _controllerDescriptionPlace = TextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(

      body: Stack(
        children: [
          GradientBack(height: 300.0),
          Row( //App Bar
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

          Container( //Safe Area - CardView
            margin: EdgeInsets.only(
              top: 120.0,
              bottom: 20.0,
            ),
            child: ListView(
              children: [
                Container(), //Foto
                Container( //TextField Title
                  margin: EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  child: WidgetTextField(
                      hintText: "Title",
                      inputType: null,
                      maxLines: 1,
                      controller: _controllerTitlePlace),
                ),
                WidgetTextField(
                    hintText: "Description",
                    inputType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _controllerDescriptionPlace,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}