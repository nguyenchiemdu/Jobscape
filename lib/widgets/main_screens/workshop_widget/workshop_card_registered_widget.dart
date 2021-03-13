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
  Duration duration;
  WorkshopCardRegister(this.image_source, this.for_whom, this.title,
      this.timeStamp, this.speaker) {
    // List timeList =
    //     timeStamp.toDate().difference(DateTime.now()).toString().split(':');
    //   int day = (int.parse(timeList[0]) / 24).round();
    // print(DateFormat('d').format(timeStamp.toDate()));
    // print(DateFormat('d').format(DateTime.now()));
    duration = timeStamp.toDate().difference(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.all(0),
              content: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    top: -50,
                    left: ScreenUtil().setWidth(260),
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.close),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(309),
                    height: ScreenUtil().setHeight(415),
                    // decoration: new BoxDecoration(
                    //     color: Color(0xffffffff),
                    //     borderRadius: BorderRadius.circular(12),
                    //     boxShadow: [BoxShadow(
                    //         color: Color(0x26454545),
                    //         offset: Offset(0,5),
                    //         blurRadius: 6,
                    //         spreadRadius: 0
                    //     ) ],
                    //   ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8, right: 8, left: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(image_source,
                                fit: BoxFit.fill,
                                width: ScreenUtil().setWidth(293),
                                height: ScreenUtil().setHeight(159)),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: ScreenUtil().setWidth(293),
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(12),
                                bottom: ScreenUtil().setHeight(12)),
                            child: Text(title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff000000),
                                  fontSize: ScreenUtil().setSp(20),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: ScreenUtil().setWidth(261),
                          height: ScreenUtil().setHeight(69),
                          decoration:
                              new BoxDecoration(color: Color(0xffffefcc)),
                          child: Text(
                              "Đào tạo MIỄN PHÍ về kỹ năng chuẩn bị kinh doanh, kỹ năng mềm và sử dụng kênh digital để tăng hiệu suất",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff888888),
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(12),
                              left: ScreenUtil().setWidth(20)),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(6)),
                                  width: ScreenUtil().setWidth(20),
                                  height: ScreenUtil().setHeight(20),
                                  child: Image.asset(
                                      "assets/images/speaker_icon.png")),
                              Text(speaker,
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff000000),
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(6),
                              left: ScreenUtil().setWidth(20)),
                          child: Row(
                            children: [
                              Container(
                                  width: ScreenUtil().setWidth(20),
                                  height: ScreenUtil().setHeight(20),
                                  margin: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(6)),
                                  child: Image.asset(
                                      "assets/images/good_for_icon.png")),
                              Container(
                                child: Text(for_whom,
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(14),
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(6),
                              left: ScreenUtil().setWidth(20)),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(6)),
                                  width: ScreenUtil().setWidth(20),
                                  height: ScreenUtil().setHeight(20),
                                  child: Image.asset(
                                      "assets/images/date_icon.png")),
                              Text(
                                  DateFormat('MMM dd, y')
                                      .format(timeStamp.toDate()),
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff000000),
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(6),
                              left: ScreenUtil().setWidth(20)),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(6)),
                                  width: ScreenUtil().setWidth(20),
                                  height: ScreenUtil().setHeight(20),
                                  child: Image.asset(
                                      "assets/images/link_icon.png")),
                              Text("https:\/\/ww.loremlorem.com\/",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff000000),
                                    fontSize: ScreenUtil().setSp(14),
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [],
            );
          },
        );
      },
      child: Stack(children: [
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
          height: ScreenUtil().setHeight(225),
          width: ScreenUtil().setWidth(192),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                child: Text(duration.inDays.toString() + " next\ndays",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xffffffff),
                      fontSize: ScreenUtil().setSp(13),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )))),
      ]),
    );
  }
}
