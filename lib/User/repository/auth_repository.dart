

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_trips_flutter_app/User/repository/firebase_auth_api.dart';

class AuthRepository {

  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();
  
}