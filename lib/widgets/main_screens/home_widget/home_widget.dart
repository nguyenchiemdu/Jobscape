import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:learning_app/widgets/main_screens/home_widget/advisor_widget.dart';
import './workshop_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'ourteam_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWidget extends StatelessWidget {
  Function selectPage;
  HomeWidget(this.selectPage);
  dynamic tx = DateTime.now();

  void redirectWorkshop() {
    selectPage(2);
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return SingleChildScrollView(
        child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/top_background.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(68)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 21, right: 12),
                      width: ScreenUtil().setWidth(48),
                      height: ScreenUtil().setWidth(48),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                FirebaseAuth.instance.currentUser.photoURL),
                            fit: BoxFit.fill,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(258),
                          margin: EdgeInsets.only(bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Text(
                                      "Hello " +
                                          FirebaseAuth
                                              .instance.currentUser.displayName
                                              .toString(),
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Color(0xff000000),
                                        fontSize: ScreenUtil().setSp(14,
                                            allowFontScalingSelf: true),
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ))),
                              Container(
                                child: Text(
                                  "Today is " + DateFormat.yMMMMd().format(tx),
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff000000),
                                    fontSize: ScreenUtil()
                                        .setSp(12, allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(258),
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                              "\"Plant your garden and decorate your own soul, instead of waiting for someone to bring you flowers.\"",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: ScreenUtil().setSp(12),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  selectPage(1);
                },
                child: Container(
                    // width: MediaQuery.of(context).size.width*0.9,
                    // height: MediaQuery.of(context).size.height*0.353,
                    width: ScreenUtil().setWidth(324),
                    height: ScreenUtil().setHeight(270),
                    margin: EdgeInsets.only(left: 24, right: 24, top: 30),
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/getjob.png"),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                            spreadRadius: 0)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 28, left: 24),
                          child: Text("Here’s how to get your Dream Job!",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff303030),
                                fontSize: ScreenUtil()
                                    .setSp(16, allowFontScalingSelf: true),
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(151),
                          height: ScreenUtil().setHeight(100),
                          margin: EdgeInsets.only(top: 6, left: 24),
                          child: Text(
                              "Explore the essential skill sets to secure a job in Information Technology, Marketing, Finance, and more. Recommended by 300+ professionals.\nAnd totally FREE.",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff303030),
                                fontSize: ScreenUtil()
                                    .setSp(12, allowFontScalingSelf: true),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(59),
                              left: 25,
                              right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("300+",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Color(0xffffbf2f),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Text("Professionals",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Color(0xff000000),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )),
                                ],
                              ),
                              Container(
                                  width: 0,
                                  height: 50,
                                  decoration: new BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFEEEEEE)),
                                  )),
                              Column(
                                children: [
                                  Text("30+",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Color(0xffffbf2f),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Text("Roadmaps",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Color(0xff000000),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )),
                                ],
                              ),
                              Container(
                                  width: 0,
                                  height: 50,
                                  decoration: new BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFEEEEEE)),
                                  )),
                              Column(
                                children: [
                                  Text("1500+",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Color(0xffffbf2f),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Text("Courses",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Color(0xff000000),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),

              // IndustryIntro(),
              Workshop(redirectWorkshop),
              Advisor(),
              OurTeam(),

              // SliderCard(),
              // SliderCard(),
              // SliderCard(),
              RaisedButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                child: Text('Logg out'),
              ),
            ],
          ),
        ),
      )),
    ));
  }
}
