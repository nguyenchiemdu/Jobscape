import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:learning_app/models/question_database.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:learning_app/widgets/main_screens/home_widget/avatar_home_widget.dart';

class WriteComment extends StatelessWidget {
  String path;
  TextEditingController comment = TextEditingController();
  WriteComment(this.path);
  void submitComment(BuildContext ctx)async{
    if (comment.text == '')
    {      
      Scaffold.of(ctx).showSnackBar(SnackBar(
          content: Text("Enter question first !"),
          duration: Duration(milliseconds: 500),
        ));
      return;
    }
    Map<String,dynamic> data = {
      'avatarURL':  await UserDatabaseService().getUserphotoURL(),
      'date': Timestamp.now(),
      'text': comment.text,
      'upVote': 0,
      'user' : await UserDatabaseService().getUserDisplayname(),
    };
    await QuestionDataBase().submitComment(data, path);
    comment.text = '';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(260),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AvatarHomeWidget(40),
            // Container(
            //   margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            //   width: ScreenUtil().setWidth(40),
            //   height: ScreenUtil().setWidth(40),
            //   decoration: new BoxDecoration(
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //         image: CachedNetworkImageProvider("https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/avatar%2Favatar.png?alt=media&token=a72c897f-1ce3-4e1d-ba00-aaba287b66eb"),
            //         fit: BoxFit.fill,
            //       )),
            // ),
            Expanded(
              child: TextField(
                  // keyboardType: TextInputType.multiline,
                  controller: comment,
                  maxLines: null,
                  decoration: InputDecoration(hintText: "Write a comment...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(10,allowFontScalingSelf: false),
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff000000),),
                      contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(13)),
                      enabledBorder: new OutlineInputBorder(borderRadius: new BorderRadius.circular(25),
                      borderSide: new BorderSide(color: Colors.transparent)),
    suffixIcon: IconButton(icon: Icon(Icons.send_rounded, color: Color(0xffffbf2f),size: 20,),
                          onPressed:() {submitComment(context);})
                  )
              ),
            ),
          ],
      ),
    );
  }
}