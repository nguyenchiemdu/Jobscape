import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:learning_app/models/users_database.dart';

class WorkshopCard extends StatelessWidget {
  String image_source;
  String for_whom;
  String title;
  Timestamp timeStamp;
  String speaker;
  String workshopId;
  WorkshopCard(this.image_source, this.for_whom, this.title, this.timeStamp,
      this.speaker, this.workshopId);
  void remindMe() {
    UserDatabaseService().addRemindWorkShop(workshopId);
  }

  @override
  Widget build(BuildContext context) {
    // print(DateFormat('MMM dd y').format(dateTime));
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
        ]),
      ),
      Container(
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(156)),
          width: ScreenUtil().setWidth(38),
          height: ScreenUtil().setHeight(38),
          decoration: new BoxDecoration(
            color: Color(0xffffbf2f),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Center(
            widthFactor: ScreenUtil().setWidth(20),
            heightFactor: ScreenUtil().setHeight(20),
            child: Image.asset("assets/images/info_icon.png",
                width: ScreenUtil().setWidth(20),
                height: ScreenUtil().setHeight(20)),
          )),
      Container(
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(156),
              top: ScreenUtil().setHeight(173)),
          width: ScreenUtil().setWidth(38),
          height: ScreenUtil().setHeight(38),
          decoration: new BoxDecoration(
            color: Color(0xffffbf2f),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(30),
            ),
          ),
          child: InkWell(
            onTap: () {
              remindMe();
            },
            child: Center(
              widthFactor: ScreenUtil().setWidth(17),
              heightFactor: ScreenUtil().setHeight(17),
              child: Image.asset("assets/images/register_icon.png",
                  width: ScreenUtil().setWidth(17),
                  height: ScreenUtil().setHeight(17)),
            ),
          )),
    ]);
  }
}
