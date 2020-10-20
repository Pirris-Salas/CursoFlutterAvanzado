import 'package:flutter/material.dart';
import 'profile_place.dart';
import '../../../Place/model/place.dart';

class ProfilePlacesList extends StatelessWidget {

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
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      ),
    );
  }
}
