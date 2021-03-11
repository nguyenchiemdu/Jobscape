import 'package:cloud_firestore/cloud_firestore.dart';

class LogoCourseDataBase {
  CollectionReference logoCuorseReference =
      FirebaseFirestore.instance.collection('logoCourseReference');
  Future uploadData(Map data) async {
    await logoCuorseReference.add(data).then((value) {
      print('added logoCuorseReference successfully');
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future getAllCourseLogo() async {
    Map result = await logoCuorseReference.get().then((value) {
      Map res = {};
      for (QueryDocumentSnapshot logo in value.docs) {
        res[logo.data()['provider']] = logo.data()['imgSrc'];
      }
      return res;
    }).onError((error, stackTrace) {
      print(error.toString());
      return null;
    });
    return result;
  }
}
