import 'package:cached_network_image/cached_network_image.dart';
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
  String description;
  WorkshopCard(this.image_source, this.for_whom, this.title, this.timeStamp,
      this.speaker, this.workshopId, this.description);
  void remindMe(BuildContext context) async {
    bool status = await UserDatabaseService().addRemindWorkShop(workshopId);
    // nếu đã có workshop trong reminder thì status sẽ là false, còn chưa thì là true
    print(status);
    if (status)
      showAlertDialog(context);
    else
      showAlertRegistered(context);
    // thong bao may da dang ki workshop nay roi
    ;
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
              child:
                  // Image.network(image_source,
                  CachedNetworkImage(
                      imageUrl: image_source,
                      placeholder: (context, url) => Image(
                          image: AssetImage('assets/images/top_image.png')),
                      // CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
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
          child: InkWell(
            child: Center(
              widthFactor: ScreenUtil().setWidth(20),
              heightFactor: ScreenUtil().setHeight(20),
              child: Image.asset("assets/images/info_icon.png",
                  width: ScreenUtil().setWidth(20),
                  height: ScreenUtil().setHeight(20)),
            ),
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
                          height: ScreenUtil().setHeight(456),
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
                                margin:
                                    EdgeInsets.only(top: 8, right: 8, left: 8),
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
                                child: Text(description,
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
                              Center(
                                child: Container(
                                    width: ScreenUtil().setWidth(178),
                                    height: ScreenUtil().setHeight(40),
                                    margin: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(20)),
                                    child: RaisedButton(
                                        onPressed: () {
                                          remindMe(context);
                                          // showAlertDialog(context);
                                        },
                                        color: Color(0xffffbf2f),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text("Register",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xffffffff),
                                              fontSize: ScreenUtil().setSp(17),
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                            )))),
                              )
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
              remindMe(context);
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

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Registration Confirmation",
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          color: Color(0xff000000),
          fontSize: ScreenUtil().setSp(20),
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        )),
    content: Text(
        "Thank you for registering onto our workshop! Please remember to check your reminder box and join our workshop. We are looking forward to seeing your there.",
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          color: Color(0xff000000),
          fontSize: ScreenUtil().setSp(14),
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
        )),
    actions: [
      okButton,
    ],
  );
// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertRegistered(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Registration Notification",
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          color: Color(0xff000000),
          fontSize: ScreenUtil().setSp(20),
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        )),
    content: Text(
        "You already registered for this event. Please wait for further instructions from hosts or see more information in the Reminder Box",
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          color: Color(0xff000000),
          fontSize: ScreenUtil().setSp(14),
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
        )),
    actions: [
      okButton,
    ],
  );
// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
