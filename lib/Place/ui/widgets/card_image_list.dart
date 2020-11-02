import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/Place/model/place.dart';
import 'package:my_trips_flutter_app/User/bloc/bloc_user.dart';
import 'package:my_trips_flutter_app/User/model/user.dart';
import 'card_image.dart';

class CardImageList extends StatefulWidget {

  User user;

  CardImageList(@required this.user);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardImageList();
  }

}

BlocUser userBloc;

class _CardImageList extends State<CardImageList>{

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
                print("PLACESLIST: WAITING");
                return CircularProgressIndicator();
              case ConnectionState.none:
                print("PLACESLIST: NONE");
                return CircularProgressIndicator();
              case ConnectionState.active:
                print("PLACESLIST: ACTIVE");
                return buildPlacesCard(userBloc.buildPlaces(snapshot.data.documents, widget.user));
              case ConnectionState.done:
                print("PLACESLIST: DONE");
                return buildPlacesCard(userBloc.buildPlaces(snapshot.data.docuements, widget.user));
              default:
                print("PLACESLIST: DEFAULT");
                return buildPlacesCard(userBloc.buildPlaces(snapshot.data.documents, widget.user));
            }
          }
      ),
    );
  }

  Widget buildPlacesCard(List<Place> places){

    void setLiked(Place place){
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
      });
    }

    IconData iconFilled = Icons.favorite_outlined;
    IconData iconWithBorder = Icons.favorite_border_outlined;

    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place){
        return CardImageWithFabIcon(
            pathImage: place.urlImage,
            height: 250.0,
            width: 350.0,
            left: 20.0,
            //iconFilled: iconFilled,
            iconWithBorder: place.liked?iconFilled:iconWithBorder,
            onPressed: (){
              setLiked(place);
            },
        );
      }).toList(),
    );
  }


}

