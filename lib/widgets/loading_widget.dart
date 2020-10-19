import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trips_flutter_app/User/ui/screens/sign_in_screen.dart';

class LoadingWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _LoadingWidget();
  }
}

class _LoadingWidget extends State<LoadingWidget>{

  @override
  Widget build(BuildContext context) {
    return Loading();
  }

  Widget Loading(){
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.0,
            width: 70.0,
            child: CircularProgressIndicator(
              backgroundColor: Colors.cyan[400],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              "L o a d i n g",
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 22.0,
                fontFamily: "Lato",
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

}