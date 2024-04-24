// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PhotoPostRepo {
  Future<String> postPhoto(photo) async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('${DateTime.now().millisecondsSinceEpoch.toString()}');
    firebase_storage.UploadTask uploadTask = ref.putFile(File(photo));
    await uploadTask;
    var newUrl = await ref.getDownloadURL();
    return newUrl;
  }
}
