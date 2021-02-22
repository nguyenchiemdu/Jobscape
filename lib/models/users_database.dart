import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final String uid;
  UserDatabaseService({this.uid});
  final CollectionReference users =
  FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, int completed_course, int enrolled_course, int reputation) async {
    return await users.doc(uid).set({
      'name':name,
      'completed_course': completed_course,
      'enrolled_course': enrolled_course,
      'reputation': reputation,
    });
  }

  Future getUserEnrolledCourse(uid) async {
    var document = await FirebaseFirestore.instance.collection('users').doc(uid).get().then((data){
      return data.data()['enrolled_course'];
    });
  }

}