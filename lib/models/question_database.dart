import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuestionDataBase{
  CollectionReference questions = FirebaseFirestore.instance.collection('questions');
  String uid = FirebaseAuth.instance.currentUser.uid;

  Future submitQuestion(Map<String,dynamic> data)async{
    await questions.add(data)
                    .then((value){
                      print('submit question completed');

                    })
                    .onError((error, stackTrace){print('failed to submit question : '+error.toString());});
    
  }
  Future submitComment(Map<String,dynamic> data,String path)async{
    await FirebaseFirestore.instance.collection(path+'/listComment')
                                    .add(data)
                                    .then((value){print('add comment completed!');})
                                    .onError((error, stackTrace){print('failed to add comment :'+error.toString());});
  }

  Future addUpvote(String path)async {
    
    String id = path.split('/')[path.split('/').length-1];
    List ls = path.split('/');
    ls.removeLast();
    path = ls.join('/');
    List listUpvote;
    int upvote;
    await FirebaseFirestore.instance.collection(path)
            .doc(id)
            .get()
            .then((res){
              listUpvote = res.data()['listUpvote'];
              upvote = res.data()['upVote'];
            })
            .onError((error, stackTrace){print('failed to get listUPvote:' +error.toString());});
    if (listUpvote == null || listUpvote.indexOf(uid)==-1){
      if (listUpvote== null) listUpvote = [];
     { listUpvote.add(uid);upvote= upvote+1;}
    }
    else
    {listUpvote.remove(uid);upvote = upvote -1;}
    await FirebaseFirestore.instance.collection(path)
            .doc(id)
            .update(
              {
                'listUpvote' : listUpvote,
                'upVote' : upvote,
              }
            )
            .onError((error, stackTrace){print('failed to upvote: '+error.toString());});
  }
  Future<List> getListQuestion() async{
    List res = [];
    await questions.get()
      .then((querysnapshot){
        querysnapshot.docs.forEach((element) {
          Map tmp = element.data();
          tmp['path'] = 'questions/'+ element.id;
          res.add(tmp);
        });
      })
      .onError((error, stackTrace){print('failed to get list question: '+ error.toString());});
    return res;
  }
  Future<List> getListData(String path,String collection)async{
    List res = [];
    await FirebaseFirestore.instance.collection(path+'/'+ collection)
                                    .get()
                                    .then((querysnapshot){
                                      querysnapshot.docs.forEach((comment) { 
                                        Map tmp ;
                                        tmp = comment.data();
                                        tmp['path'] = path+'/'+ collection+'/'+comment.id;
                                        res.add(tmp);
                                      });
                                    })
                                    .onError((error, stackTrace){print('failed to get '+collection+' :'+error.toString());});
    return res;
  }

}