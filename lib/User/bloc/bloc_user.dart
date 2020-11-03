import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/Place/model/place.dart';
import 'package:my_trips_flutter_app/Place/repository/firebase_storage_repository.dart';
import 'package:my_trips_flutter_app/Place/ui/widgets/card_image.dart';
import 'package:my_trips_flutter_app/User/model/user.dart';
import 'package:my_trips_flutter_app/User/repository/auth_repository.dart';
import 'package:my_trips_flutter_app/User/repository/cloud_firestore_api.dart';
import 'package:my_trips_flutter_app/User/repository/cloud_firestore_repository.dart';
import 'package:my_trips_flutter_app/User/ui/widgets/profile_place.dart';

class BlocUser implements Bloc {

  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Firebase responde con Streams
  //Stream - Firebase
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance
      .onAuthStateChanged;

  //Monitoreamos el Stream
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Casos de uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }

  //2do Caso de Uso
  //Registrar Usuario en Base de Datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);


  //Caso 3
  //Agregar un nuevo lugar por parte del usuario

  Future<void> updateUserPlace(Place place) =>
      _cloudFirestoreRepository.updateUserPlace(place);

  //Caso 4
  //Obtener el uid del usuario autenticado
  Future<FirebaseUser> get currentUserID => FirebaseAuth.instance.currentUser();

  //Caso 5
  //Guadar la foto de un lugar en Firebase Storage
  final firebaseStorageRepository = FirebaseStorageRepository();

  Future<StorageUploadTask> uploadFile(String path, File image) =>
      firebaseStorageRepository.uploadFile(path, image);

  //Caso 6
  //Descargando imágenes desde FirebaseStorage utilizando un Stream como listener

  Stream<QuerySnapshot> placesListStream = Firestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;

 List<Place> buildPlaces (List<DocumentSnapshot> placesListSnapshot, User user) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot, user);


  //Trayendo los objetos tipo Place de Firebase según el uid del usuario
  //El uid lo pasamos a través del stream declarado en profile_places_list
  Stream<QuerySnapshot> myPlacesListStream (String uid) => Firestore.instance.collection(CloudFirestoreAPI().PLACES)
      .where("userOwner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/${uid}")).snapshots();

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);


  //Caso # Manejando la lógica de likes
  Future likePlace(Place place, String uid) => _cloudFirestoreRepository.likePlace(place, uid);


  //Trayendo la data de un place en home cuando este es seleccionado
  StreamController<Place> placeSelectedStreamController = StreamController<Place>.broadcast();
  Stream<Place> get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink<Place> get placeSelectedSink => placeSelectedStreamController.sink;


  //Caso para cerrar sesión
  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    placeSelectedStreamController.close();
  }


}