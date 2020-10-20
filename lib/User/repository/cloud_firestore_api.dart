import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_trips_flutter_app/User/model/user.dart';

class CloudFirestoreAPI {
  //Constantes
  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance; //Declaramos la instancia

  //Actualiza la data acerca de la última sesión
  void updateUserData(User user) async {
    if (user != null) {
      DocumentReference ref = _db.collection(USERS).document(user.uid);
      return ref.setData({
        'uid': user.uid,
        'name': user.name,
        'email': user.email,
        'photoURL': user.photoURL,
        'placesList': user.placesList,
        'favoritePlaces': user.favoritePlaces,
        'lastSignIn': DateTime.now()
      }, merge: true); //merge guarda los cambios en la base de datos, commit
    }else{
      print("No estamos atrapando datos");
    }
  }
}
