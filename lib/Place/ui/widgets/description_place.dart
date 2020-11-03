import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/Place/model/place.dart';
import 'package:my_trips_flutter_app/User/bloc/bloc_user.dart';
import '../../../widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String descriptionPlace;
  String namePlace;
  int stars;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);


  final iconStar = new Container(
    margin: EdgeInsets.only(
      top: 323.0,
      right: 3.0,
    ),
    child: new Icon(
      Icons.star,
      color: Color(0xFFf2C611),
    ),
  );

  final emptyStar = new Container(
    margin: EdgeInsets.only(
      top: 323.0,
      right: 3.0,
    ),
    child: new Icon(
      Icons.star_border,
      color: Colors.black26,
    ),
  );

  final halfStar = new Container(
    margin: EdgeInsets.only(
      top: 323.0,
      right: 3.0,
    ),
    child: new Icon(
      Icons.star_half,
      color: Color(0xFFf2C611),
    ),
  );

  @override
  Widget build(BuildContext context) {
    BlocUser userBloc = BlocProvider.of<BlocUser>(context);

    return StreamBuilder<Place>(
        stream: userBloc.placeSelectedStream,
        builder: (BuildContext context, AsyncSnapshot<Place> snapshot) {
          if (snapshot.hasData) {
            print("PLACE SELECTED: ${snapshot.data.name}");
            Place place = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                titleStars(place),
                placeDescription(place.description),
                ButtonPurple(
                  buttonText: "Navigate",
                  onPressed: () {},
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 370.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text(
                    "Selecciona un lugar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            );
          }
        });
  }

  Widget titleStars(Place place) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            right: 20.0,
            left: 20.0,
          ),
          child: Text(
            place.name,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              fontFamily: "Lato",
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children:countingLikes(place),
        ),
      ],
    );
  }

  List<Widget> countingLikes(Place place) {
    List<Widget> iconWidgets = List<Widget>();
    if (place.likes == 0) {
      int i = 0;
      while (i < 5) {
        i++;
        iconWidgets.add(emptyStar);
      }
    } else if (place.likes > 5) {
      int i = 0;
      while (i < 5) {
        i++;
        iconWidgets.add(iconStar);
      }
    } else if (place.likes < 5) {
      int i = 0;
      while (i < 2) {
        i++;
        iconWidgets.add(iconStar);
      }
      iconWidgets.add(halfStar);
    }

    return iconWidgets;
  }

  Widget placeDescription(String descriptionPlace){

    return Container(
      //width: MediaQuery.of(context).size.width - 4,
      margin: EdgeInsets.only(
        top: 20,
        right: 20.0,
        left: 20.0,
      ),
      child: Text(
        descriptionPlace,
        //overflow: TextOverflow.ellipsis,
        //maxLines: 20,
        style: const TextStyle(
            fontSize: 15.5,
            fontFamily: "Lato",
            fontWeight: FontWeight.w500,
            color: Color(0xFF56575a)
          //letterSpacing: 0.5
        ),
      ),
    );
  }
}
