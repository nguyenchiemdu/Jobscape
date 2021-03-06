import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WorkshopCardRegister extends StatelessWidget {
  String image_source;
  String for_whom;
  String title;
  Timestamp timeStamp;
  String speaker;
  int duration;
  WorkshopCardRegister(this.image_source, this.for_whom, this.title,
      this.timeStamp, this.speaker) {
    // List timeList =
    //     timeStamp.toDate().difference(DateTime.now()).toString().split(':');
    //   int day = (int.parse(timeList[0]) / 24).round();
    // print(DateFormat('d').format(timeStamp.toDate()));
    // print(DateFormat('d').format(DateTime.now()));
    duration = int.parse(DateFormat('d').format(timeStamp.toDate())) -
        int.parse(DateFormat('d').format(DateTime.now()));
    // print(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(
            right: ScreenUtil().setWidth(12),
            left: ScreenUtil().setWidth(2),
            bottom: ScreenUtil().setHeight(2)),
        decoration: new BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x26454545),
              offset: Offset(0, 5),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ],
        ),
        height: ScreenUtil().setHeight(211),
        width: ScreenUtil().setWidth(192),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(top: 5, right: 5, left: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(image_source,
                  fit: BoxFit.fill,
                  width: ScreenUtil().setWidth(182),
                  height: ScreenUtil().setHeight(99)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 12, right: 5, bottom: 8),
            child: Text(title,
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff000000),
                  fontSize: ScreenUtil().setSp(14),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, bottom: 3),
            child: Row(
              children: [
                Container(
                    width: ScreenUtil().setWidth(12),
                    height: ScreenUtil().setHeight(12),
                    margin: EdgeInsets.only(right: 4),
                    child: Image.asset("assets/images/good_for_icon.png")),
                Container(
                  child: Text(for_whom,
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff000000),
                        fontSize: ScreenUtil().setSp(9),
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, bottom: 3),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 4),
                    width: ScreenUtil().setWidth(12),
                    height: ScreenUtil().setHeight(12),
                    child: Image.asset("assets/images/speaker_icon.png")),
                Text(speaker,
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(9),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 4),
                    width: ScreenUtil().setWidth(12),
                    height: ScreenUtil().setHeight(12),
                    child: Image.asset("assets/images/date_icon.png")),
                Text(DateFormat('MMM dd, y').format(timeStamp.toDate()),
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(9),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, bottom: 3),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 4),
                    width: ScreenUtil().setWidth(12),
                    height: ScreenUtil().setHeight(12),
                    child: Image.asset("assets/images/link_icon.png")),
                Text("https:\/\/ww.loremlorem.com\/",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(9),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                    )),
              ],
            ),
          ),
        ]),
      ),
      Container(
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(134)),
          width: ScreenUtil().setWidth(60),
          height: ScreenUtil().setHeight(38),
          decoration: new BoxDecoration(
            color: Color(0xffffbf2f),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Center(
              child: Text(duration.toString() + " next\ndays",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xffffffff),
                    fontSize: ScreenUtil().setSp(13),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )))),
    ]);
  }
}
