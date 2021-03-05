import 'package:cloud_firestore/cloud_firestore.dart';
// import 'workshop_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DatabaseManager {
  final CollectionReference industry =
      FirebaseFirestore.instance.collection('industry');
  // Future<void> createWorkshop()
  // async {
  //   return await workshops.add({
  //     'title': title,
  //     'speaker': speaker,
  //     'image_source': image_source,
  //     'link': link,
  //     'date': date
  //   });
  // }

  Future getIndustryList() async {
    List industryList = [];

    try {
      await industry.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          industryList.add(element.data());
        });
      });
      return industryList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getIndustryField(String fieldId) async {
    dynamic industryField;
    // DocumentReference doc_ref= industry.doc("lob23eRlBqmNJqw1hVJP");
    //                 print(doc_ref.id);
    try {
      Query it = industry.where("field", isEqualTo: fieldId);

      await it.get().then((querySnapshot) {
        // querySnapshot.docs.forEach((element) {
        //   itlist.add(element.data());
        // });
        industryField = querySnapshot.docs[0].data();
        industryField['id'] = querySnapshot.docs[0].id.toString();
        industryField['path'] = 'industry/'+querySnapshot.docs[0].id.toString();
      });
      return industryField;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future getListReviewCourse(String path) async{
    List result = [];
    Map tmp;
    try {
      await FirebaseFirestore.instance.collection(path+'/listReview').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          tmp = element.data();
          tmp['id'] = element.id.toString();
          tmp['path'] = path+'/listReview/'+tmp['id'];
          result.add(tmp);
        });
      });
      return result;
    } catch (e){
        print(e.toString());
      return null;
    }
  }
   Future getListCourse(String path) async{
    List result = [];
    Map tmp;
    try {
      await FirebaseFirestore.instance.collection(path+'/listCourse').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          tmp = element.data();
          tmp['id'] = element.id.toString();
          tmp['path'] = path+'/listCourse/'+tmp['id'];
          result.add(tmp);
        });
      });
      return result;
    } catch (e){
        print(e.toString());
      return null;
    }
  }
  Future getListSkill(String path)async{
    List result = [];
    Map tmp;
    try {
      await FirebaseFirestore.instance.collection(path+'/listSkill').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          tmp = element.data();
          tmp['id'] = element.id.toString();
          tmp['path'] = path+'/listSkill/'+tmp['id'];
          result.add(tmp);
        });
      });
      return result;
    } catch (e){
        print(e.toString());
      return null;
    }
  }
  Future<List> getListJobs(String industryId) async{
    List result = [];
    Map tmp;
    try {
      await FirebaseFirestore.instance.collection('industry/$industryId/listJobs').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          tmp = element.data();
          tmp['id'] = element.id.toString();
          tmp['path'] = 'industry/$industryId/listJobs/'+tmp['id'];
          result.add(tmp);
        });
      });
      return result;
    } catch (e){
        print(e.toString());
      return null;
    }
  }
  Future upVote(String path)async{
    List list = path.split('/');
    String docId = list[list.length-1];
    list.removeLast();
    path =  list.join('/');
    Map result;
    CollectionReference review = FirebaseFirestore.instance.collection(path);
    await review.doc(docId).get().then((querySnapshot) => {
    result = querySnapshot.data()
    });
    List listUpvote = result['listUpvote'];
    if (listUpvote == null || listUpvote.indexOf(FirebaseAuth.instance.currentUser.uid) ==-1)
      {
        if (listUpvote == null) listUpvote =[];
        listUpvote.add(FirebaseAuth.instance.currentUser.uid);
        await review.doc(docId).update(
          {
            'listUpvote' : listUpvote,
            'upvote': listUpvote.length
          }
          )
          .then((value) => print("UpVoted"))
          .catchError((error) => print("Failed to add UpVote: $error"));
      }
    else
      {
        listUpvote.remove(FirebaseAuth.instance.currentUser.uid);
        await review.doc(docId).update(
          {
            'listUpvote' : listUpvote,
            'upvote': listUpvote.length
          }
          )
          .then((value) => print(" dis UpVoted"))
          .catchError((error) => print("Failed to dis UpVote: $error"));
      }
  }
  Future getListRoadMap(String path) async{
    List result = [];
    Map tmp;
    try {
      await FirebaseFirestore.instance.collection(path+'/listRoadMap').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          tmp = element.data();
          tmp['id'] = element.id.toString();
          tmp['path'] = path+'/listRoadMap/'+tmp['id'];
          result.add(tmp);
        });
      });
      return result;
    } catch (e){
        print(e.toString());
      return null;
    }
  }
  Future addReview(Map data,String path){
    final CollectionReference listReview =
      FirebaseFirestore.instance.collection(path+'/listReview');
    try{
       return listReview
          .add(data)
          .then((value) => print("Review Added"))
          .catchError((error) => print("Failed to add Review: $error"));


    } catch (e){
      print(e.toString());
      return null;
    }

  }
  Future addCourse(Map<String,dynamic> data,{String path="defaultid"}) async{
    final CollectionReference listCourse =
      FirebaseFirestore.instance.collection(path+'/listCourse');
    try{
       return listCourse
          .add(data)
          .then((value) => print("Course Added"))
          .catchError((error) => print("Failed to add Course: $error"));


    } catch (e){
      print(e.toString());
      return null;
    }

  }
  
  Future addSkill(Map<String,dynamic> data,{String path="defaultid"}) async{
    final CollectionReference listSkills =
      FirebaseFirestore.instance.collection(path+'/listSkill');
    try{
       return listSkills
          .add(data)
          .then((value) => print("Skill Added"))
          .catchError((error) => print("Failed to add Skill: $error"));


    } catch (e){
      print(e.toString());
      return null;
    }

  }

  Future addJob(Map<String,dynamic> data,{String path="defaultid"}) async{
    final CollectionReference listJobs =
      FirebaseFirestore.instance.collection(path+'/listRoadMap');
    try{
       return listJobs
          .add(data)
          .then((value) => print("listJob Added"))
          .catchError((error) => print("Failed to add listJobs: $error"));


    } catch (e){
      print(e.toString());
      return null;
    }

  }


  
}
