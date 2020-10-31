import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_trips_flutter_app/Place/model/place.dart';
import 'package:my_trips_flutter_app/Place/ui/widgets/card_image.dart';
import 'package:my_trips_flutter_app/Place/ui/widgets/widget_textfield_location.dart';
import 'package:my_trips_flutter_app/User/bloc/bloc_user.dart';
import 'package:my_trips_flutter_app/widgets/button_back.dart';
import 'package:my_trips_flutter_app/widgets/button_purple.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  final _controllerLocationPlace = TextEditingController();
  bool autovalidate = false;

  /*
  void initState() {
    super.initState();
    _controllerTitlePlace.addListener(() {});
    _controllerDescriptionPlace.addListener(() { });
    _controllerLocationPlace.addListener(() { });
  }

  void dispose() {
    _controllerTitlePlace.dispose();
    _controllerDescriptionPlace.dispose();
    _controllerLocationPlace.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {

    BlocUser userBloc = BlocProvider.of(context);

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
                        onPressed: (){
                          ImagePicker.pickImage(source: ImageSource.camera)
                              .then((File image) {
                                Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => AddPlaceScreen(
                                      image: image,
                                    )));
                          }).catchError((onError) => print(onError));
                        }),
                  ),
                ), //Foto
                Container(

                  child: Form(
                    key: formKey,
                    autovalidate: autovalidate,
                    child: Column(children: [
                          //TextField Title
                        WidgetTextField(
                              hintText: "Title",
                              inputType: null,
                              maxLines: 1,
                              controller: _controllerTitlePlace),
                        WidgetTextField(
                          hintText: "Description",
                          inputType: TextInputType.multiline,
                          maxLines: 4,
                          controller: _controllerDescriptionPlace,
                        ),
                      ],
                    ),
                  ),
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
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: () {
                      // Paso 1 - Preparar datos
                      // Luego insertar datos al Cloud Firestore
                      //Place - title, description, url, userOwner, like

                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        userBloc.updateUserPlace(Place(
                          name: _controllerTitlePlace.text,
                          description: _controllerDescriptionPlace.text,
                          likes: 0,
                        ))
                            .whenComplete(() {
                          print("Carga de datos Place completada");
                          Navigator.pop(context);

                        });
                      }else{
                        setState(() {
                          autovalidate = true;
                        });
                      }

                      // Paso 2. Subir imagen al Firebase Storage
                      // Devuelve url
                    },
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
