import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_trips_flutter_app/Place/model/place.dart';
import 'package:my_trips_flutter_app/User/model/user.dart';
import 'package:my_trips_flutter_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  //Constantes
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Firestore _db = Firestore.instance; //Declaramos la instancia

  //Actualiza la data acerca de la última sesión
  void updateUserData(User user) async {
    if (user != null) {
      DocumentReference ref = _db.collection(USERS).document(user.uid);
      return await ref.setData({
        'uid': user.uid,
        'name': user.name,
        'email': user.email,
        'photoURL': user.photoURL,
        'placesList': user.placesList,
        'favoritePlaces': user.favoritePlaces,
        'lastSignIn': DateTime.now()
      }, merge: true); //merge guarda los cambios en la base de datos, commit
    } else {
      print("No estamos atrapando datos");
    }
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    String uid =
        (await _auth.currentUser()).uid; //validamos si existe un usuario

    await refPlaces.add({
      'name': place.name,
      'urlImage': place.urlImage,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _db.document("$USERS/$uid")
      //uid reference - vinculamos usuario
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        snapshot.documentID; //ID Place Referencia Array
        DocumentReference refUsers = _db.collection(USERS).document(uid);
        refUsers.updateData({
          'placesList': FieldValue.arrayUnion(
              [_db.document("${PLACES}/${snapshot.documentID}")])
        });
      });
    });
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();
    placesListSnapshot.forEach((element) {
      profilePlaces.add(ProfilePlace(Place(
          name: element.data['name'],
          description: element.data['description'],
          urlImage: element.data['urlImage'],
          likes: element.data['likes'])));
    });
    return profilePlaces;
  }

  List buildPlaces(List placesListSnapshot, User user) {
    List<Place> places = List<Place>();

    placesListSnapshot.forEach((element) {
      Place place = Place(
          id: element.documentID,
          name: element.data["name"],
          description: element.data["description"],
          urlImage: element.data["urlImage"],
          likes: element.data["likes"]);

      List usersLikedRefs = element.data["usersLiked"];
      place.liked = false;
      usersLikedRefs?.forEach((drUL) {
        if(user.uid == drUL.documentID){
          place.liked = true;
        }
      });
      places.add(place);
    });
    return places;
  }

  //Función para Likes
  Future likePlace(Place place, String uid) async {
    await _db
        .collection(PLACES)
        .document(place.id)
        .get()
        .then((DocumentSnapshot ds) {
      int likes = ds.data['likes'];

      _db.collection(PLACES).document(place.id).updateData({
        'likes': place.liked ? likes + 1 : likes - 1,
        'usersLiked': place.liked
            ? FieldValue.arrayUnion([_db.document("${USERS}/${uid}")])
            : FieldValue.arrayRemove([_db.document("${USERS}/${uid}")])
      });
    });
  }

  //Función para likes desde muchos dispositivos
  Future likesFromManyDevices(String idPlace) {
    _db.runTransaction((transaction) async {
      DocumentSnapshot placeDS =
          await _db.collection(this.PLACES).document(idPlace).get();
      await transaction
          .update(placeDS.reference, {"likes": placeDS.data['likes'] + 1});
    });
  }

/* List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageWithFabIcon> placesCard = List<CardImageWithFabIcon>();
    IconData iconFilled = Icons.favorite_outlined;
    IconData iconWithBorder = Icons.favorite_border_outlined;
    double height = 250.0;
    double width = 350.0;
    double left = 20.0;

    placesListSnapshot.forEach((element) {
      placesCard.add(CardImageWithFabIcon(
          pathImage: element.data["urlImage"],
          height: height,
          width: width,
          left: left,
          iconFilled: iconFilled,
          iconWithBorder: iconWithBorder,
          onPressed: (){
            likesFromManyDevices(element.documentID);
          }
      ));
    });

    return placesCard;
  }
*/

}
