import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  Future<void> uploadExample() async {
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // print(appDocDir.absolute);
    // String filePath = '${appDocDir.absolute}/file-to-upload.png';
    // ...
    await uploadFile('assets/images/bell_icon.png');
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/file-to-upload.png')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }
}
