import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future initJoinWorkshop() async {
    await users
        .doc(uid)
        .update({
          'joinedWorkshop': 0,
        })
        .then((value) => print('init joinedWorkshop completed '))
        .catchError((e) {
          print('init joinedWorkshop error: ' + e);
        });
  }

  Future<List> getLearnedSkills(String path) async {
    List res = [];
    await FirebaseFirestore.instance
        .collection('/users/$uid/listLearnedSkill')
        .where('path', isEqualTo: path)
        .get()
        .then((querySnapshot) => querySnapshot.docs.forEach((element) {
              res.add(element.data());
            }));
    return res;
  }

  Future<int> getJoinedWorkshop() async {
    int res;
    await users.doc(uid).get().then((snapshot) {
      if (snapshot.data()['joinedWorkshop'] == null) {
        print('joined workshop is null, trying to init ');
        initJoinWorkshop();
        res = 0;
      } else {
        res = snapshot['joinedWorkshop'];
      }
    });
    return res;
  }

  Future getUserEnrolledCourse(uid) async {
    try {
      int course;
      var document = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then((data) {
        course = data.data()['enrolled_course'];
      });
      return course;
    } catch (e) {
      print(e);
    }
  }

  Future<List> getRemindWorkShopId() async {
    final String id = FirebaseAuth.instance.currentUser.uid;
    List remindWorkShop;
    Map l = {};

    try {
      await users
          .doc(id)
          .get()
          .then((user) => {remindWorkShop = user.data()['remindWorkshop']});
      return remindWorkShop;
    } catch (e) {
      print('Failed to get remindWorkshopIds:' + e);
      return null;
    }
  }

  Future<bool> addRemindWorkShop(String workshopId) async {
    final String id = FirebaseAuth.instance.currentUser.uid;
    List remindWorkShopId = await this.getRemindWorkShopId();
    if (remindWorkShopId == null) remindWorkShopId = [];
    if (remindWorkShopId.indexOf(workshopId) == -1) {
      remindWorkShopId.add(workshopId);
      await users
          .doc(id)
          .update({'remindWorkshop': remindWorkShopId})
          .then((value) => {
                () {
                  print('added remindWorkshop');
                }
              })
          .catchError((e) {
            print('Failed to add remindWorkshop');
          });
      return true;
    } else
      return false;
  }
}
