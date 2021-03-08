import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/proof_submit_widget.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  int joindedWorkshop = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    int result =
        await UserDatabaseService(uid: FirebaseAuth.instance.currentUser.uid)
            .getJoinedWorkshop();
    setState(() {
      joindedWorkshop = result;
    });
  }

  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubmitProof()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(20), left: ScreenUtil().setWidth(21)),
      child: Row(
        children: [
          Container(
            height: ScreenUtil().setHeight(175),
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(18)),
                width: ScreenUtil().setWidth(153),
                height: ScreenUtil().setHeight(168),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  border: Border.all(color: Color(0xffffefcc), width: 1.5),
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x1a454545),
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20),
                              left: ScreenUtil().setWidth(14),
                              right: ScreenUtil().setWidth(17)),
                          width: ScreenUtil().setWidth(46),
                          height: ScreenUtil().setHeight(50.4),
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/plus_icon.png"),
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(20)),
                                  width: 2,
                                  height: ScreenUtil().setHeight(28),
                                  decoration: new BoxDecoration(
                                      color: Color(0xffffbf2f)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(20),
                                          bottom: ScreenUtil().setHeight(2),
                                          left: ScreenUtil().setWidth(5)),
                                      child: Text("Register",
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            color: Color(0xff000000),
                                            fontSize: ScreenUtil().setSp(10),
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(5)),
                                      child: RichText(
                                          text: new TextSpan(children: [
                                        new TextSpan(
                                            text: "9",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xff000000),
                                              fontSize: ScreenUtil().setSp(12),
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                            )),
                                        new TextSpan(
                                            text: " workshops",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xff000000),
                                              fontSize: ScreenUtil().setSp(10),
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.normal,
                                            )),
                                      ])),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(7),
                                  bottom: ScreenUtil().setHeight(10)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 2,
                                    height: ScreenUtil().setHeight(28),
                                    decoration: new BoxDecoration(
                                        color: Color(0xffffbf2f)),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: ScreenUtil().setHeight(2),
                                            left: ScreenUtil().setWidth(5)),
                                        child: Text("Joined",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xff000000),
                                              fontSize: ScreenUtil().setSp(10),
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.normal,
                                            )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(5)),
                                        child: RichText(
                                            text: new TextSpan(children: [
                                          new TextSpan(
                                              text: joindedWorkshop.toString(),
                                              style: TextStyle(
                                                fontFamily: 'SFProDisplay',
                                                color: Color(0xff000000),
                                                fontSize:
                                                    ScreenUtil().setSp(12),
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                              )),
                                          new TextSpan(
                                              text: " workshops",
                                              style: TextStyle(
                                                fontFamily: 'SFProDisplay',
                                                color: Color(0xff000000),
                                                fontSize:
                                                    ScreenUtil().setSp(10),
                                                fontWeight: FontWeight.w300,
                                                fontStyle: FontStyle.normal,
                                              )),
                                        ])),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: new Container(
                          width: 119,
                          height: 2,
                          decoration: new BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          )),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(80),
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(16),
                          left: ScreenUtil().setWidth(14)),
                      child: Text("Continue your journey",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                    )
                  ],
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(118),
                left: ScreenUtil().setWidth(100),
                child: Container(
                  width: ScreenUtil().setWidth(70),
                  height: ScreenUtil().setHeight(70),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bag_icon.png"),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              )
            ]),
          ),
          Container(
            height: ScreenUtil().setHeight(175),
            child: Stack(children: [
              Container(
                width: ScreenUtil().setWidth(147),
                height: ScreenUtil().setHeight(168),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  border: Border.all(color: Color(0xffffefcc), width: 1.5),
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x1a454545),
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: Colors.transparent,
                            onPressed: () {
                              print('tapped btn');
                              changeScreen(context);
                            },
                            child: null,
                          ),
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(20),
                              left: ScreenUtil().setWidth(14),
                              right: ScreenUtil().setWidth(17)),
                          width: ScreenUtil().setWidth(46),
                          height: ScreenUtil().setHeight(50.4),
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/plus_icon.png"),
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(20)),
                                  width: 2,
                                  height: ScreenUtil().setHeight(28),
                                  decoration: new BoxDecoration(
                                      color: Color(0xffffbf2f)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(20),
                                          bottom: ScreenUtil().setHeight(2),
                                          left: ScreenUtil().setWidth(5)),
                                      child: Text("Tested",
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            color: Color(0xff000000),
                                            fontSize: ScreenUtil().setSp(10),
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.normal,
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(5)),
                                      child: RichText(
                                          text: new TextSpan(children: [
                                        new TextSpan(
                                            text: "29",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xff000000),
                                              fontSize: ScreenUtil().setSp(12),
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                            )),
                                        new TextSpan(
                                            text: " times",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xff000000),
                                              fontSize: ScreenUtil().setSp(10),
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.normal,
                                            )),
                                      ])),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(7),
                                  bottom: ScreenUtil().setHeight(10)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 2,
                                    height: ScreenUtil().setHeight(28),
                                    decoration: new BoxDecoration(
                                        color: Color(0xffffbf2f)),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: ScreenUtil().setHeight(2),
                                            left: ScreenUtil().setWidth(5)),
                                        child: Text("Submitted",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xff000000),
                                              fontSize: ScreenUtil().setSp(10),
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.normal,
                                            )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(5)),
                                        child: RichText(
                                            text: new TextSpan(children: [
                                          new TextSpan(
                                              text: "14",
                                              style: TextStyle(
                                                fontFamily: 'SFProDisplay',
                                                color: Color(0xff000000),
                                                fontSize:
                                                    ScreenUtil().setSp(12),
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                              )),
                                          new TextSpan(
                                              text: " times",
                                              style: TextStyle(
                                                fontFamily: 'SFProDisplay',
                                                color: Color(0xff000000),
                                                fontSize:
                                                    ScreenUtil().setSp(10),
                                                fontWeight: FontWeight.w300,
                                                fontStyle: FontStyle.normal,
                                              )),
                                        ])),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: new Container(
                          width: 119,
                          height: 2,
                          decoration: new BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(11),
                          left: ScreenUtil().setWidth(14)),
                      child:
                          Text("Test/ Submit \nproof for your \nnewest skill",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                    )
                  ],
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(118),
                left: ScreenUtil().setWidth(100),
                child: Container(
                  width: ScreenUtil().setWidth(68),
                  height: ScreenUtil().setHeight(70),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/light_icon.png"),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
