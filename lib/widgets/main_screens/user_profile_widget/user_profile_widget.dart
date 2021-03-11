import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:learning_app/models/logo_course_database.dart';
import 'package:learning_app/widgets/main_screens/home_widget/display_name_widget.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/background_image_profile_widget.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/course_completed_widget.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/journey_completed_widget.dart';
import 'package:provider/provider.dart';

import 'edit_profile_screen.dart';

class UserProfileWidget extends StatelessWidget {
  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditUserProfile()),
    );
  }

  final Map<String, dynamic> logoCourse = {
    'provider': 'Simplilearn',
    'imgSrc':
        'https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/logoCourse%2FSimplilearn.jpeg?alt=media&token=8a0f2def-1934-411d-8960-570ef38e4984'
  };
  @override
  Widget build(BuildContext context) {
    LogoCourseDataBase().uploadData(logoCourse);
    return Stack(children: [
      BackgroundProfileWidget(),
      Container(
        width: ScreenUtil().setWidth(360),
        height: ScreenUtil().setHeight(760),
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_user_profile.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(210)),
          // padding: EdgeInsets.only(left: ScreenUtil().setWidth(24),right: ScreenUtil().setWidth(24)),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          right: ScreenUtil().setWidth(10),
                        ),
                        child: DisplayName(
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: ScreenUtil()
                                .setSp(20, allowFontScalingSelf: false),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        )),
                    InkWell(
                      onTap: () {
                        changeScreen(context);
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(16),
                        height: ScreenUtil().setHeight(16),
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/edit_icon.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(6),
                    left: ScreenUtil().setWidth(24)),
                child: Text("22 years old - UI/UX Designer  -  Junior",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize:
                          ScreenUtil().setSp(15, allowFontScalingSelf: false),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(6),
                    bottom: ScreenUtil().setHeight(36),
                    left: ScreenUtil().setWidth(24)),
                child: Text(FirebaseAuth.instance.currentUser.email,
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize:
                          ScreenUtil().setSp(15, allowFontScalingSelf: false),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setHeight(40),
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/scholar_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(4)),
                          child: Text("Scholar\nRanking",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: ScreenUtil()
                                    .setSp(14, allowFontScalingSelf: false),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ],
                    ),
                    Container(
                        width: 0,
                        height: ScreenUtil().setHeight(68),
                        decoration: new BoxDecoration(
                          border: Border.all(color: Color(0xFFEEEEEE)),
                        )),
                    Column(
                      children: [
                        Text("12",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xffffbf2f),
                              fontSize: ScreenUtil()
                                  .setSp(30, allowFontScalingSelf: false),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(4)),
                          child: Text("Courses\nCompleted",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: ScreenUtil()
                                    .setSp(14, allowFontScalingSelf: false),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ],
                    ),
                    Container(
                        width: 0,
                        height: ScreenUtil().setHeight(68),
                        decoration: new BoxDecoration(
                          border: Border.all(color: Color(0xFFEEEEEE)),
                        )),
                    Column(
                      children: [
                        Text("07",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xffffbf2f),
                              fontSize: ScreenUtil()
                                  .setSp(30, allowFontScalingSelf: false),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                        Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(4)),
                          width: ScreenUtil().setWidth(65),
                          child: Text("Journeys Completed",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: ScreenUtil()
                                    .setSp(14, allowFontScalingSelf: false),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ],
                    ),
                    Container(
                        width: 0,
                        height: ScreenUtil().setHeight(68),
                        decoration: new BoxDecoration(
                          border: Border.all(color: Color(0xFFEEEEEE)),
                        )),
                    Column(
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setHeight(40),
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/cv_icon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(4)),
                          width: ScreenUtil().setWidth(50),
                          child: Text("View your CV",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: ScreenUtil()
                                    .setSp(14, allowFontScalingSelf: false),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CourseCompleted(),
              JourneyCompleted(),
            ]),
          ),
        ),
      ),
      Positioned(
        left: ScreenUtil().setWidth(306),
        top: ScreenUtil().setHeight(46),
        child: InkWell(
          onTap: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
          },
          child: Container(
            width: ScreenUtil().setWidth(30),
            height: ScreenUtil().setHeight(30),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logout_icon.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
