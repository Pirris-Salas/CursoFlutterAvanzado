import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/User/bloc/bloc_user.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  BlocUser userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<BlocUser>(context);

    return Container(
      height: 350.0,
      child: StreamBuilder(
          stream: userBloc.placesStream,
          builder: (context, AsyncSnapshot snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.active:
                return buildPlacesCard(userBloc.buildPlaces(snapshot.data.documents));
              case ConnectionState.done:
                return buildPlacesCard(userBloc.buildPlaces(snapshot.data.docuements));
              default:
                return buildPlacesCard(userBloc.buildPlaces(snapshot.data.documents));
            }
          }
      ),
    );
  }

  Widget buildPlacesCard(List<CardImageWithFabIcon> placesCard){
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }
}

