import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/question_database.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:learning_app/widgets/main_screens/home_widget/avatar_home_widget.dart';
import 'package:learning_app/widgets/main_screens/question_widget/write_comment_card.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'comment_card.dart';

class QuestionCard extends StatefulWidget {
  final Map question;
  QuestionCard(this.question);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  List listComment = [];
  List<Widget> listCommentWidget = [];
  bool upvoteState = false;
  String upvoteStatus = 'unlike';
  int upVote = 0;
  bool isTranslated = false;
  String questionText ='';
  String userName = '';
  String photoUrl;
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      getData();
      configUpvote();
    }
  void getData()async{
      List res = await QuestionDataBase().getListData(widget.question['path'], 'listComment');
      String name = await UserDatabaseService().getUserDisplayname(uid: widget.question['user']);
      String url = await UserDatabaseService().getUserphotoURL(uid :widget.question['user']);
      setState(() {
              userName = name;
              photoUrl = url;
            });
      if (res != null)
      
      setState(() {
              listComment = res;
              listCommentWidget = res.map((comment) => CommentCard(comment)).toList();
            });
  }
  void configUpvote(){
    bool state;
    String text;
    if (widget.question['listUpvote']== null || widget.question['listUpvote'].indexOf(FirebaseAuth.instance.currentUser.uid) ==-1)
      state = false;
    else state = true;
    if (state)
      text = 'like';
    else text = 'unlike';
    setState(() {
          upVote = widget.question['upVote'];
          upvoteStatus = text;
          upvoteState = state;
          questionText = widget.question['text'];
        });
  }
  void upvote() async{
    if (upvoteState)
      {
        int i = upVote-1;
       setState(() {
                upVote = i ;
                upvoteStatus = 'unlike';
                upvoteState = !upvoteState;
              });

      }
    else
      {
        int i = upVote+1;
        setState(() {
                  upVote = i;
                  upvoteStatus = 'like';
                  upvoteState = !upvoteState;
                });
      }
    await QuestionDataBase().addUpvote(widget.question['path']);
  }
  void translate(){
    String text;
    if (isTranslated)
     text = widget.question['text'];
    else text = widget.question['translated']['vi'];
    setState(() {
          questionText = text;
          isTranslated = !isTranslated;
        });    
  }
  @override
  void didUpdateWidget(covariant QuestionCard oldWidget) {
      // TODO: implement didUpdateWidget
      super.didUpdateWidget(oldWidget);
      if (oldWidget.question != widget.question)
           getData();
      configUpvote();
    }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: ScreenUtil().setHeight(25),
            width: ScreenUtil().setWidth(360),
          ),
          Container(
      width: ScreenUtil().setWidth(312),
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(16),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                      width: ScreenUtil().setWidth(40),
                      height: ScreenUtil().setWidth(40),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image:  photoUrl!= null ? DecorationImage(
                        image:CachedNetworkImageProvider(photoUrl),
                        fit: BoxFit.fill,
                      ): null
                      ),
                      ),
                  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName,
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff000000),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(2),
                      width: ScreenUtil().setWidth(100),
                    ),
                    Text(timeago.format(widget.question['date'].toDate()),
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff888888),
                          fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),

                  ],
                )
                ],
              ),
              IconButton(icon: Icon(Icons.translate_rounded,
              color: isTranslated ?  Color(0xffffbf2f) :Color(0xff888888),), 
              onPressed: () {translate();})
            ],
          ),
          SizedBox(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(12),
          ),
          Text(questionText,
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
              )
          ),
          SizedBox(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(16),
          ),
          Container(
              width: ScreenUtil().setWidth(280),
              height: 0,
              decoration: new BoxDecoration(
                border: Border.all(color: Color(0xffdddddd)),
              )),
          SizedBox(
            width: ScreenUtil().setWidth(132),
            height: ScreenUtil().setHeight(11),
          ),
          Container(
            width: ScreenUtil().setWidth(215),
            child: Row(
              children: [
                InkWell(
                  onTap: upvote,
                  child: Container(
                    width: ScreenUtil().setWidth(20),
                    height: ScreenUtil().setHeight(20),
                    child: Image.asset("assets/images/$upvoteStatus"+"_icon.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(4)),
                  child: Text(upVote.toString(),
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: !upvoteState ? Color(0xff888888) : Color(0xffffbf2f),
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(132),
                  height: ScreenUtil().setHeight(10),
                ),
                Container(
                  width: ScreenUtil().setWidth(20),
                  height: ScreenUtil().setHeight(20),
                  child: Image.asset("assets/images/like_icon.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(4)),
                  child: Text(listComment.length.toString(),
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff888888),
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(132),
            height: ScreenUtil().setHeight(11),
          ),
          Container(
              width: ScreenUtil().setWidth(280),
              height: 0,
              decoration: new BoxDecoration(
                border: Border.all(color: Color(0xffdddddd)),
              )),
          SizedBox(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(15),
          ),
          WriteComment(widget.question['path']),
          Column(
            children: listCommentWidget,
          )
        ],
      ),
    ),
          
          SizedBox(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(15),
          ),
      ],
    );
    
    
  }
}