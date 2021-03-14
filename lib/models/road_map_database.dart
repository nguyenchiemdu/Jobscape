import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RoadMapDataBase {
  CollectionReference roadMapReference =
      FirebaseFirestore.instance.collection('roadMapReference');
  Future<List> getListRoadMapReference() async {
    List<Map> res = [];
    await roadMapReference.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        res.add(element.data());
      });
    }).onError((error, stackTrace) {
      print(error.toString());
      return null;
    });
    return res;
  }
}
