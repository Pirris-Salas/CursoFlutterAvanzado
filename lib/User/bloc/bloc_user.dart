import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_trips_flutter_app/User/repository/auth_repository.dart';

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

  @override
  void dispose() {
    // TODO: implement dispose
  }


}