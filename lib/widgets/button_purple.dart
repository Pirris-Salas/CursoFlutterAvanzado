import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget{
  
  final String buttonText;
  final VoidCallback onPressed;
  
  ButtonPurple({
    Key key,
    @required this.buttonText,
    @required this.onPressed
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30.0,
        right: 20.0,
        left: 20.0,
        bottom: 25.0,
      ),
      height: 50.0,
      width: 180.0,
      child: InkWell(
        //FUNCIONALIDAD ON TAP, PARA EL BOTÓN
        //ACTIVA UN SNACKBAR CON UN TEXTO
        /*onTap: () {
          Scaffold.of(context).showSnackBar(
              SnackBar(
                  content: Text("Navigating")
              ),
          );
        },*/
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              colors: [
                Color(0xFF4268D3),
                Color(0xFF584CD1),
              ],
              begin: FractionalOffset(0.2,0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0,0.6],
              tileMode: TileMode.clamp,
            )
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white,
              ),
            ),
          )
        ),
      ),
    );
  }
  
}