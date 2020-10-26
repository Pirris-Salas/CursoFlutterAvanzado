import 'package:flutter/material.dart';

class ButtonBack extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonBack();
  }


}

class _ButtonBack extends State<ButtonBack>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: IconButton(
          icon: Icon(Icons.keyboard_arrow_left,
          color: Colors.white,
          size: 50,
          ),
          onPressed: (){
            //Navigator.of(context).pop();
            Navigator.pop(context);
          },
      ),
    );
  }
}