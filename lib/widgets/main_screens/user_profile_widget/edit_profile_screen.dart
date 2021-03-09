import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/course_completed_widget.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/journey_completed_widget.dart';
import 'package:provider/provider.dart';

class EditUserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
          children: [
            Container(
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(259),
              decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        FirebaseAuth.instance.currentUser.photoURL),
                    fit: BoxFit.fill,
                  )),
            ),
            Container(
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(760),
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image:
                  AssetImage("assets/images/background_user_profile.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(24),top: ScreenUtil().setHeight(232)),
                    child: Text("Edit Profile",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff000000),
                          fontSize: ScreenUtil().setSp(20,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  ),
                  Container(
                      // margin:
                      // EdgeInsets.only(left: 24, right: 24, bottom: 15),
                      width: ScreenUtil().setWidth(327),
                      height: ScreenUtil().setHeight(40),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffffefcc)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a777777),
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          obscureText: true,
                          // controller: password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            // contentPadding: EdgeInsets.only(
                            //     left: 14, top: 18, bottom: 18),
                            hintStyle: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff303030),
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ))),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                    child: Row(
                      children: [
                        Container(
                            margin:
                            EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                            width: ScreenUtil().setWidth(248),
                            height: ScreenUtil().setHeight(40),
                            padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                            decoration: new BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffffefcc)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x1a777777),
                                    offset: Offset(0, 2),
                                    blurRadius: 3,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: TextField(
                                obscureText: true,
                                // controller: password,
                                decoration: InputDecoration(
                                  // hintText: 'Password',
                                  // contentPadding: EdgeInsets.only(
                                  //     left: 14, top: 18, bottom: 18),
                                  hintStyle: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff303030),
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ))),
                        Container(
                            width: ScreenUtil().setWidth(54),
                            height: ScreenUtil().setHeight(40),
                            padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                            decoration: new BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffffefcc)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x1a777777),
                                    offset: Offset(0, 2),
                                    blurRadius: 3,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: TextField(
                                obscureText: true,
                                // controller: password,
                                decoration: InputDecoration(
                                  // hintText: 'Password',
                                  // contentPadding: EdgeInsets.only(
                                  //     left: 14, top: 18, bottom: 18),
                                  hintStyle: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff303030),
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ))),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      width: ScreenUtil().setWidth(327),
                      height: ScreenUtil().setHeight(40),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffffefcc)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a777777),
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          obscureText: true,
                          // controller: password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            // contentPadding: EdgeInsets.only(
                            //     left: 14, top: 18, bottom: 18),
                            hintStyle: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff303030),
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      width: ScreenUtil().setWidth(327),
                      height: ScreenUtil().setHeight(40),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffffefcc)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a777777),
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          obscureText: true,
                          // controller: password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            // contentPadding: EdgeInsets.only(
                            //     left: 14, top: 18, bottom: 18),
                            hintStyle: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff303030),
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      width: ScreenUtil().setWidth(327),
                      height: ScreenUtil().setHeight(40),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffffefcc)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a777777),
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          obscureText: true,
                          // controller: password,
                          decoration: InputDecoration(
                            // hintText: 'Password',
                            // contentPadding: EdgeInsets.only(
                            //     left: 14, top: 18, bottom: 18),
                            hintStyle: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff303030),
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ))),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top:ScreenUtil().setHeight(45)),
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(130),
                        padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
                        decoration: new BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x1a000000),
                                offset: Offset(0, 3),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                        ),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          strokeWidth: 1,
                          radius: Radius.circular(12),
                          dashPattern: [4, 4],
                          color: Color(0xffffbf2f),
                          child: Container(
                            width: ScreenUtil().setWidth(276),
                            height: ScreenUtil().setHeight(143),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: ScreenUtil().setWidth(48),
                                  height: ScreenUtil().setHeight(48),
                                  decoration: new BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                      AssetImage("assets/images/image_upload.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(4),
                                    ),
                                    width: ScreenUtil().setWidth(120),
                                    height: ScreenUtil().setHeight(28),
                                    child: RaisedButton(
                                        onPressed: () {},
                                        color: Color(0xffffbf2f),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text("Upload CV",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xffffffff),
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                            )))),
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
            )
          ]
      ),
    );
  }
}
