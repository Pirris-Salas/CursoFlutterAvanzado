import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_trips_flutter_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    
    return _SignInScreen();
  }
  
}

class _SignInScreen extends State<SignInScreen>{
  
  @override
  Widget build(BuildContext context) {
    
    return signInGoogleUI();
  }
  
  
  Widget signInGoogleUI(){
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(" ", height),
          Column(
            children: [
              Text("Welcome\n This is your Travel App",
              style: TextStyle(
                fontSize: 37.0,
                fontFamily: 'Lato',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              )
            ],
          )
        ],
      ),
    );
  }
  
}