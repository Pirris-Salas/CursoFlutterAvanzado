import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {
final StorageReference _storageReference = FirebaseStorage.instance.ref();

//Este metodo se enfoca en la subida del archivo
Future<StorageUploadTask> uploadFile(String path, File image) async {
  return _storageReference.child(path).putFile(image);
}

}