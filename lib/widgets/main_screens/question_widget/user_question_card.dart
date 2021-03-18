import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/widgets/main_screens/home_widget/avatar_home_widget.dart';
import 'package:learning_app/widgets/main_screens/question_widget/write_comment_card.dart';

import 'comment_card.dart';

class QuestionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image: DecorationImage(
                    image: CachedNetworkImageProvider("https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/avatar%2Favatar.png?alt=media&token=a72c897f-1ce3-4e1d-ba00-aaba287b66eb"),
                    fit: BoxFit.fill,
                  )),
                  ),
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ARIN Như Trương",
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
                Text("15 minutes ago",
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
          SizedBox(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(12),
          ),
          Text("Lorem ipum Lorem ipum Lorem ipum Lorem ipum \nLorem ipum \nLorem ipum Lorem ipum  ",
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
                Container(
                  width: ScreenUtil().setWidth(20),
                  height: ScreenUtil().setHeight(20),
                  child: Image.asset("assets/images/like_icon.png"),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(4)),
                  child: Text("34",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xffffbf2f),
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
                  child: Text("15",
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
          WriteComment(),
          CommentCard(),
        ],
      ),
    );
  }
}