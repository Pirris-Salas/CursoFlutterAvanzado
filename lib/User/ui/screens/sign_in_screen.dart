import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/User/bloc/bloc_user.dart';
import 'package:my_trips_flutter_app/widgets/button_gmail.dart';
import 'package:my_trips_flutter_app/widgets/button_green.dart';
import 'package:my_trips_flutter_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    
    return _SignInScreen();
  }
  
}

class _SignInScreen extends State<SignInScreen>{

  BlocUser userBloc;
  
  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);
    
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
              ),
              ButtonGreen(text: "Login with Gmail", onPressed: (){

              },
              width: 300.0,
              height: 50.0,
              ),

              ButtonGmail(onPressed: (){
                userBloc.signIn().then((FirebaseUser value) => print("Bienvenido: ${value.displayName}"));
              }),
            ],
          )
        ],
      ),
    );
  }
  
}