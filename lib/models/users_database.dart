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

  Future updateUserData(
      int completed_course, int enrolled_course, int reputation) async {
    String displayName = FirebaseAuth.instance.currentUser.displayName;
    String photoURL = FirebaseAuth.instance.currentUser.photoURL;
    if (displayName == null) {
      displayName = FirebaseAuth.instance.currentUser.email.split('@')[0];
    }
    if (photoURL == null) {
      photoURL =
          'https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/avatar%2Favatar.png?alt=media&token=a72c897f-1ce3-4e1d-ba00-aaba287b66eb';
    }
    String backgroundURL =
        'https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/avatar%2Fcover.png?alt=media&token=b3be3201-e739-430b-862d-faa1a96f66a2';
    return await users.doc(uid).set({
      'displayName': displayName,
      'email': FirebaseAuth.instance.currentUser.email,
      'completed_course': completed_course,
      'enrolled_course': enrolled_course,
      'reputation': reputation,
      'photoURL': photoURL,
      'backgroundURL': backgroundURL,
      'isNewUser': true,
      'registeredWorkshop': 0,
      'proofsSubmitted': 0,
      'journeyCompleted': 0,
      'typeUser' : 'trial'
    });
  }

  Future getPathToJoinedJourney() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String res;
    await users.doc(uid).get().then((value) {
      res = value.data()['pathToJoinedJourney'];
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    return res;
  }

  Future<bool> getTypeOfUser() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    bool res;
    await users.doc(uid).get().then((value) {
      res = value.data()['isNewUser'];
    }).onError((error, stackTrace) {
      print('Failed to get type of user: ' + error.toString());
    });
    return res;
  }

  Future<String> getUserDisplayname() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String res;
    await users.doc(uid).get().then((value) {
      res = value.data()['displayName'];
    }).onError((error, stackTrace) {
      print('failed to get user displayName : ' + error.toString());
    });
    return res;
  }

  Future<String> getUserbackgroundURL() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String res;
    await users.doc(uid).get().then((value) {
      res = value.data()['backgroundURL'];
    }).onError((error, stackTrace) {
      print('failed to get user photoURL : ' + error.toString());
    });
    return res;
  }

  Future updateUserPhotoURL(String photoURL) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    await users.doc(uid).update({'photoURL': photoURL}).then((value) {
      print('updated user photo URL');
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future<String> getUserphotoURL() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    String res;
    await users.doc(uid).get().then((value) {
      res = value.data()['photoURL'];
    }).onError((error, stackTrace) {
      print('failed to get user photoURL : ' + error.toString());
    });
    return res;
  }

  Future<Map> getUserInfor() async {
    Map res;
    String uid = FirebaseAuth.instance.currentUser.uid;
    await users
        .doc(uid)
        .get()
        .then((value) => res = value.data())
        .onError((error, stackTrace) {
      print('failed to get user infor : ' + error.toString());
      return {};
    });
    return res;
  }

  Future uploadProfile(Map proFile) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    await users
        .doc(uid)
        .update(proFile)
        .then((value) => print('upload profile completed'))
        .onError((error, stackTrace) {
      print('failed to upload profile : ' + error.toString());
    });
  }

  Future initRegisteredWorkshop() async {
    await users
        .doc(uid)
        .update({
          'registeredWorkshop': 0,
        })
        .then((value) => print('init registeredWorkshop completed '))
        .catchError((e) {
          print('init registeredWorkshop error: ' + e);
        });
  }

  Future initErnolledCourse() async {
    await users
        .doc(uid)
        .update({
          'enrolled_course': 0,
        })
        .then((value) => print('init enrolled_course completed '))
        .catchError((e) {
          print('init enrolled_course error: ' + e);
        });
  }

  Future initNumber(String field) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    await users
        .doc(uid)
        .update({
          field: 0,
        })
        .then((value) => print('init $field completed '))
        .catchError((e) {
          print('init $field error: ' + e.toString());
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

  Future<int> getProofsSubmitted() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    int res;
    await users.doc(uid).get().then((snapshot) {
      if (snapshot.data()['proofsSubmitted'] == null) {
        print('proofsSubmitted is null, trying to init ');
        initNumber('proofsSubmitted');
        res = 0;
      } else {
        res = snapshot.data()['proofsSubmitted'];
      }
    });
    return res;
  }

  Future<int> getRegisteredWorkshop() async {
    int res;
    await users.doc(uid).get().then((snapshot) {
      if (snapshot.data()['registeredWorkshop'] == null) {
        print('registeredWorkshop is null, trying to init ');
        initRegisteredWorkshop();
        res = 0;
      } else {
        res = snapshot.data()['registeredWorkshop'];
      }
    });
    return res;
  }

  Future<int> getEnrolledCourse() async {
    int res;
    String uid = FirebaseAuth.instance.currentUser.uid;
    await users.doc(uid).get().then((snapshot) {
      if (snapshot.data()['enrolled_course'] == null) {
        print('enrolled course is null, trying to init ');
        initErnolledCourse();
        res = 0;
      } else {
        res = snapshot.data()['enrolled_course'];
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

  Future submitProof(
      {String skillName, String fullPath, String proofURL}) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference listProof =
        FirebaseFirestore.instance.collection('users/$uid/listProof');
    List list = fullPath.split('/');
    String skillId = list[list.length - 1];
    list.removeLast();
    String pathToSkill = list.join('/');
    int proofsSubmitted = 0;
    await listProof
        .add({
          'skillId': skillId,
          'skillName': skillName,
          'pathToSkill': pathToSkill,
          'proofURL': proofURL
        })
        .then((value) => print('submitted Proof'))
        .onError((error, stackTrace) {
          print('Failed to submit Proof : ' + error.toString());
        });
    await users.doc(uid).get().then((value) {
      proofsSubmitted = value.data()['proofsSubmitted'];
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    proofsSubmitted += 1;
    await users.doc(uid).update({'proofsSubmitted': proofsSubmitted}).onError(
        (error, stackTrace) {
      print(error.toString());
    });
  }

  Future<bool> addRemindWorkShop(String workshopId) async {
    int registeredWorkshop = 0;
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
      await users.doc(id).get().then((value) async {
        registeredWorkshop = value.data()['registeredWorkshop'];
        registeredWorkshop += 1;
        await users
            .doc(id)
            .update({'registeredWorkshop': registeredWorkshop}).onError(
                (error, stackTrace) {
          print(error.toString());
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      return true;
    } else
      return false;
  }
}
