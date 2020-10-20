import 'package:flutter/material.dart';
import 'package:my_trips_flutter_app/Place/model/place.dart';

class User {

  final String uid;
  final String name;
  final String email;
  final String photoURL;

  final List<Place> placesList;
  final List<Place> favoritePlaces;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.placesList,
    this.favoritePlaces
});

  //favoritePlaces
 //placesList

}