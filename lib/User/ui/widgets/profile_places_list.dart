import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/User/bloc/bloc_user.dart';
import 'package:my_trips_flutter_app/User/model/user.dart';
import 'package:my_trips_flutter_app/widgets/loading_widget.dart';
import '../../../Place/model/place.dart';


class ProfilePlacesList extends StatelessWidget {
  BlocUser userBloc;
  User user;
  ProfilePlacesList(@required this.user);

  Place place = Place(
      name: 'Duwili Ella Waterfall',
      description: 'Hiking. Water fall hunting. Natural bath',
      urlImage: "https://i.imgur.com/ih1JIhw.jpg",
      likes: 4);

  Place place2 = Place(
      name: 'Forest Amazing View',
      description: 'Hiking. Water fall hunting. Natural bath. Amazing view',
      urlImage: 'https://i.imgur.com/d21twiJ.jpg',
      likes: 10);

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<BlocUser>(context);

    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
          stream: userBloc.myPlacesListStream(user.uid),
          builder: (context, AsyncSnapshot snapshot){

            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return Column(
                  children: userBloc.buildPlaces(snapshot.data.documents),
                );
              case ConnectionState.active:
                return Column(
                  children: userBloc.buildPlaces(snapshot.data.documents),
                );
              case ConnectionState.none:
                return CircularProgressIndicator();

              default:
                return Column(
                  children: userBloc.buildPlaces(snapshot.data.documents),
                );
            }
          }
      ),
    );
  }
}

/*
* Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      ),
* */
