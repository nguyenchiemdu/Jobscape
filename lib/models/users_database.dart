import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_app/main.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final String uid;

  UserDatabaseService({this.uid});

  final CollectionReference users =
  FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, int completed_course, int enrolled_course,
      int reputation) async {
    return await users.doc(uid).set({
      'name': name,
      'completed_course': completed_course,
      'enrolled_course': enrolled_course,
      'reputation': reputation,
    });
  }

  Future<int> getUserEnrolledCourse(uid) async {

    try {
      int course;
      var document = await FirebaseFirestore.instance.collection('users').doc(
          uid).get().then((data) {
        print(data.data()['enrolled_course'].runtimeType);
        course = data.data()['enrolled_course'];
      });
      return course;
    } catch (e) {
      print(e);
    }
  }
}