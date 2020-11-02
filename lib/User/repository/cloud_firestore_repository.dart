import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_trips_flutter_app/Place/model/place.dart';
import 'package:my_trips_flutter_app/Place/ui/widgets/card_image.dart';
import 'package:my_trips_flutter_app/User/model/user.dart';
import 'package:my_trips_flutter_app/User/repository/cloud_firestore_api.dart';
import 'package:my_trips_flutter_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  
final _cloudFirestoreAPI = CloudFirestoreAPI();

void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

Future<void> updateUserPlace(Place place) => _cloudFirestoreAPI.updatePlaceData(place);

List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot);

}