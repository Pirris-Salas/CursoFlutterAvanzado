import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_trips_flutter_app/Place/ui/widgets/card_image.dart';
import 'package:my_trips_flutter_app/Place/ui/widgets/widget_textfield_location.dart';
import 'package:my_trips_flutter_app/widgets/button_back.dart';
import 'package:my_trips_flutter_app/widgets/gradient_back.dart';
import 'package:my_trips_flutter_app/widgets/widget_textfield.dart';
import 'package:my_trips_flutter_app/widgets/widget_title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    final _controllerLocationPlace = TextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;

    String path = "assets/img/camara.jpg";

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 300.0),
          Row(
            //App Bar
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
              ))
            ],
          ),
          Container(
            //Safe Area - CardView
            margin: EdgeInsets.only(
              top: 120.0,
              bottom: 20.0,
            ),
            child: ListView(
              children: [
                Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 40.0),
                    width: screenWidth,
                    child: CardImageWithFabIcon(
                        pathImage:
                            widget.image != null ? widget.image.path : path,
                        height: 315.0,
                        width: 390.0,
                        left: 5.0,
                        iconFilled: Icons.camera_alt,
                        iconWithBorder: Icons.camera_alt_outlined,
                        onPressed: null),
                  ),
                ), //Foto
                Container(
                  //TextField Title
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
                Container(
                  margin: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: WidgetTextFieldLocation(
                    hintText: "Add location",
                    iconData: Icons.add_location_alt_outlined,
                    controller: _controllerLocationPlace,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
