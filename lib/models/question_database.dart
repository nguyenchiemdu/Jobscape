import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionDataBase{
  CollectionReference questions = FirebaseFirestore.instance.collection('questions');


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
        print('get list question successfully!');
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