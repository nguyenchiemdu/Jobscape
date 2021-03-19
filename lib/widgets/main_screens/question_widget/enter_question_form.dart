import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/question_database.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:learning_app/widgets/main_screens/question_widget/list_filter_card.dart';
import 'package:learning_app/widgets/main_screens/question_widget/tag_card.dart';
import 'incognito_mode_widget.dart';

class AddQuestionWidget extends StatelessWidget {
  final TextEditingController question = TextEditingController();
  bool incognitoMode = false;
  String tag ;
  void changeIncognito(){
    incognitoMode = !incognitoMode;
    print(incognitoMode);
  }
  void changeTag(String tag){
    this.tag = tag;
    print(this.tag);
  }
  void submitQuestion(BuildContext ctx)async{
    if (question.text == '')
    {      
      Scaffold.of(ctx).showSnackBar(SnackBar(
          content: Text("Enter question first !"),
          duration: Duration(milliseconds: 500),
        ));
      return;
    }
    String incognitoAvatar = 'https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/avatar%2Favatar.png?alt=media&token=a72c897f-1ce3-4e1d-ba00-aaba287b66eb';
    String avatar;
    String user ;
    if (incognitoMode) {
      avatar = incognitoAvatar;
      user = 'Jobscape User';
      }
    else {
      avatar = await UserDatabaseService().getUserphotoURL();
      user = await UserDatabaseService().getUserDisplayname();
      }
    Map<String,dynamic> data = {
      'avatarURL' : avatar,
      'date' : Timestamp.now(),
      'listUpvote' : [],
      'text' : question.text,
      'upVote' : 0,
      'user' : user,
      'tag' : tag
    };
    await QuestionDataBase().submitQuestion(data);
    question.text = '';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IncognitoModeWidget( false,changeIncognito),
          Center (
          child: Container(
            width: ScreenUtil().setWidth(312),
            height: ScreenUtil().setHeight(100),
            decoration: new BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                  color: Color(0x1a454545),
                  offset: Offset(0,5),
                  blurRadius: 6,
                  spreadRadius: 0
                  ) ],
              ),
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    controller: question ,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(hintText: "What's your question?",
                    contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(14),top: ScreenUtil().setHeight(17)),
                    border: InputBorder.none,
                      suffixIcon: IconButton(icon: Icon(Icons.send_rounded, color: Color(0xffffbf2f)),
                        onPressed:() =>submitQuestion(context))
                    )
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(15),
                  width: ScreenUtil().setWidth(312),
                ),
                Center(
                  child: Container(
                      width: ScreenUtil().setWidth(284),
                      child: ListFilter(changeTag)),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(16),
                  width: ScreenUtil().setWidth(312),
                )
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
