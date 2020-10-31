import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_trips_flutter_app/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository{

  final firebaseStorageAPI = FirebaseStorageAPI();

  Future<StorageUploadTask> uploadFile(String path, File image) => firebaseStorageAPI.uploadFile(path, image);

}