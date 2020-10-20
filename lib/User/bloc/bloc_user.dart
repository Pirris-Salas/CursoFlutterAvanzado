import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/User/model/user.dart';
import 'package:my_trips_flutter_app/User/repository/auth_repository.dart';
import 'package:my_trips_flutter_app/User/repository/cloud_firestore_repository.dart';

class BlocUser implements Bloc{

  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Firebase responde con Streams
  //Stream - Firebase
  Stream<FirebaseUser> streamFirebase =FirebaseAuth.instance.onAuthStateChanged;

  //Monitoreamos el Stream
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Casos de uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn(){
    return _auth_repository.signInFirebase();
  }

  //2do Caso de Uso
  //Registrar Usuario en Base de Datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);


  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }


}