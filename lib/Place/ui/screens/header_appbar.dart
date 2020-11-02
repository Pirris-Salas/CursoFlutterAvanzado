import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/User/bloc/bloc_user.dart';
import 'package:my_trips_flutter_app/User/model/user.dart';
import '../../../widgets/gradient_back.dart';
import '../widgets/card_image_list.dart';


class HeaderAppBar extends StatelessWidget{
  BlocUser userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<BlocUser>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.active:
            return showPlacesData(snapshot);
          case ConnectionState.done:
            return showPlacesData(snapshot);
          default:
            return showPlacesData(snapshot);
        }
      }
    );
  }

  Widget showPlacesData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      return Stack(
        children: [
          GradientBack(height: 250.0),
          Text("Usuario no autenticado. Haz login."),
        ],
      );
    }else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl,
      );
      return Stack(
        children: [
          GradientBack(height: 250),
          CardImageList(user),
        ],
      );
    }
  }

}