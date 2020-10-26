import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {

  final String hintText; //texto hint de la caja de texto
  final TextInputType inputType; //tipo de caja de texto
  final TextEditingController controller; // Controlador que nos ayudará a cargar los datos a firebase
  int maxLines = 1;

  WidgetTextField({
    Key key,
    @required this.hintText,
    @required this.inputType,
    @required this.controller,
    this.maxLines

});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
        right: 20.0,
        left: 20.0,
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFe5e5e5),
            ),
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFe5e5e5),
            ),
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          )
        ),
      ),
    );
  }

}