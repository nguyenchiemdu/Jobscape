import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:learning_app/models/question_database.dart';
import 'package:learning_app/models/users_database.dart';

class CommentCard extends StatefulWidget {
  final comment;
  CommentCard(this.comment);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool upvoteState = false;
  String upvoteStatus = 'unlike';
  int upVote = 0;
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
    String name = await UserDatabaseService().getUserDisplayname(uid: widget.comment['user']);
    String url = await UserDatabaseService().getUserphotoURL(uid: widget.comment['user']);
    setState(() {
          userName = name;
          photoUrl = url;
        });
  }
   void configUpvote(){
    bool state;
    String text;
    if (widget.comment['listUpvote']== null || widget.comment['listUpvote'].indexOf(FirebaseAuth.instance.currentUser.uid) ==-1)
      state = false;
    else state = true;
    if (state)
      text = 'like';
    else text = 'unlike';
    setState(() {
          upVote = widget.comment['upVote'];
          upvoteStatus = text;
          upvoteState = state;
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
    await QuestionDataBase().addUpvote(widget.comment['path']);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(260),
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(12),
            width: ScreenUtil().setWidth(100),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setWidth(40),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: photoUrl != null ? DecorationImage(
                    image: CachedNetworkImageProvider(photoUrl),
                    fit: BoxFit.fill,
                  )
                  : null
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
                        fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(200),
                      child: Text(widget.comment['text'],
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff000000),
                        fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,

                      )
                  ))
                ],
              ),
      ]
          ),
          Row(
            children: [
              SizedBox(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(10),
              ),
              InkWell(
                onTap: () {
                  upvote();
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: ScreenUtil().setWidth(2)),
                  // margin: EdgeInsets.only(
                  //     top: ScreenUtil().setHeight(12),
                  //     bottom: ScreenUtil().setHeight(14)),
                  width: ScreenUtil().setWidth(16),
                  height: ScreenUtil().setHeight(16),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: upvoteState?
                      AssetImage("assets/images/like_icon.png") : AssetImage("assets/images/unlike_icon.png"),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Text(upVote.toString(),
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: upvoteState? Color(0xffffbf2f) : Color(0xff303030),
                    fontSize: ScreenUtil().setSp(11),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}