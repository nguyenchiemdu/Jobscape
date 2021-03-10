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

  Future updateUserData( int completed_course, int enrolled_course,
      int reputation) async {
      String displayName = FirebaseAuth.instance.currentUser.displayName;
      String photoURL = FirebaseAuth.instance.currentUser.photoURL;
      if (displayName==null){
        displayName = FirebaseAuth.instance.currentUser.email.split('@')[0];
      }
      if (photoURL== null){
        photoURL = 'https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/avatar%2Fdefault-avatar.png?alt=media&token=96da3222-7de1-4b6e-b825-a4a5a309a97a';
      }
      String backgroundURL = 'https://i.pinimg.com/originals/42/0b/4b/420b4b7bfb03ae2310ce5d614d8cb216.jpg';
      return await users.doc(uid).set({
      'displayName':  displayName,
      'email' : FirebaseAuth.instance.currentUser.email,
      'completed_course': completed_course,
      'enrolled_course': enrolled_course,
      'reputation': reputation,
      'photoURL': photoURL,
      'backgroundURL' : backgroundURL,
    });
  }
  Future<String> getUserDisplayname()async{
    String uid  = FirebaseAuth.instance.currentUser.uid;
    String res;
    await users.doc(uid)
          .get()
          .then((value){res = value.data()['displayName'];} )
          .onError((error, stackTrace){print('failed to get user displayName : '+error.toString());});
    return res;
  }

  Future<String> getUserbackgroundURL()async{
    String uid  = FirebaseAuth.instance.currentUser.uid;
    String res;
    await users.doc(uid)
          .get()
          .then((value){res = value.data()['backgroundURL'];} )
          .onError((error, stackTrace){print('failed to get user photoURL : '+error.toString());});
    return res;
  }
  Future<String> getUserphotoURL()async{
    String uid  = FirebaseAuth.instance.currentUser.uid;
    String res;
    await users.doc(uid)
          .get()
          .then((value){res = value.data()['photoURL'];} )
          .onError((error, stackTrace){print('failed to get user photoURL : '+error.toString());});
    return res;
  }
  Future<Map> getUserInfor() async{
    Map res;
    String uid = FirebaseAuth.instance.currentUser.uid;
    await users.doc(uid)
          .get()
          .then((value) => res = value.data())
          .onError((error, stackTrace){print('failed to get user infor : '+error.toString());return null;});
    return res;
  }
  Future uploadProfile(Map proFile) async{
    String uid = FirebaseAuth.instance.currentUser.uid;
    await users.doc(uid)
                .update(proFile)
                .then((value) => print('upload profile completed'))
                .onError((error, stackTrace){print('failed to upload profile : '+error.toString());});
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

  Future submitProof({String skillName,String fullPath,String proofURL})async{
    String uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference listProof = FirebaseFirestore.instance.collection('users/$uid/listProof');
    List list = fullPath.split('/');
    String skillId = list[list.length-1];
    list.removeLast();
    String pathToSkill =list.join('/'); 

    await listProof.add({
      'skillId': skillId,
      'skillName' : skillName,
      'pathToSkill':pathToSkill,
      'proofURL':proofURL
    }).then((value) => print('submitted Proof'))
    .onError((error, stackTrace) {print('Failed to submit Proof : '+error.toString());});
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
