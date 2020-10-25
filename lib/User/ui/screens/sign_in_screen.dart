import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/User/bloc/bloc_user.dart';
import 'package:my_trips_flutter_app/User/model/user.dart';
import 'package:my_trips_flutter_app/platzi_trips.dart';
import 'package:my_trips_flutter_app/widgets/button_gmail.dart';
import 'package:my_trips_flutter_app/widgets/button_green.dart';
import 'package:my_trips_flutter_app/widgets/gradient_back.dart';
import 'package:my_trips_flutter_app/widgets/loading_widget.dart';

class SignInScreen extends StatefulWidget {
  String name;

  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  BlocUser userBloc;
  User user;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    return _handleCurrentSession();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(
            height: null,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: screenWidth,
                  margin: EdgeInsets.only(
                    left: 10.0,
                    bottom: 15.0,
                  ),
                  child: Text(
                    "Welcome,\n This is your Travel App",
                    style: TextStyle(
                      fontSize: 34.0,
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              /*ButtonGreen(text: "Login with Gmail", onPressed: (){

              },
                width: 300.0,
                height: 50.0,
              ),*/

            ],
          ),
          Container(
            alignment: Alignment(0.0, 0.4),
            child: ButtonGmail(onPressed: () {
              userBloc.signOut();
              userBloc.signIn().then((FirebaseUser user) {
                userBloc.updateUserData(User(
                    uid: user.uid,
                    name: user.displayName,
                    email: user.email,
                    photoURL: user.photoUrl));
              });
            }),
          ),
        ],
      ),
    );
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot - data - Object User
        if (snapshot.hasData) {
          return PlatziTrips();
        } else if (snapshot.hasError) {
          return Text("Ocurrió un error en la transmisión de datos");
        } else if (snapshot.connectionState != ConnectionState.waiting) {
          return signInGoogleUI();
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
