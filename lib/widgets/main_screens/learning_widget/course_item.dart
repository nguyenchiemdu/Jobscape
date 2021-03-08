import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'course_review_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseItemWidget extends StatelessWidget {
  final Map courseItem;
  CourseItemWidget(this.courseItem);

  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CrouseReviewScreen(courseItem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(12)),
                // margin: EdgeInsets.only(bottom: 9, top: 5, right: 5, left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://i0.wp.com/sourceofapk.com/wp-content/uploads/2020/11/udemy-tv-apk-latest.jpg?fit=600%2C600&ssl=1",
                    fit: BoxFit.fill,
                    width: ScreenUtil().setWidth(75),
                    height: ScreenUtil().setHeight(75),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(4)),
                    width: ScreenUtil().setWidth(224),
                    child: Text(courseItem['name'],
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff000000),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(4)),
                    child: RichText(
                        text: new TextSpan(children: [
                      new TextSpan(
                          text: "Provided by ",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff454545),
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      new TextSpan(
                          text: courseItem['provider'],
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xffffbf2f),
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                    ])),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(4)),
                    child: RichText(
                        text: new TextSpan(children: [
                      new TextSpan(
                          text: "Price ",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff454545),
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      new TextSpan(
                          text: courseItem['price'].toString() + "\$",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xffffbf2f),
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )),
                    ])),
                  ),
                  RichText(
                      text: new TextSpan(children: [
                    new TextSpan(
                        text: "Course Rating ",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(12),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    new TextSpan(
                        text: courseItem['star'].toString() + "/5",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xffffbf2f),
                          fontSize: ScreenUtil().setSp(12),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        )),
                  ])),
                  // Text(courseItem['review'].toString()),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(87),
                top: ScreenUtil().setHeight(16)),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(8)),
                    width: ScreenUtil().setWidth(122),
                    height: ScreenUtil().setHeight(30),
                    child: RaisedButton(
                        onPressed: () {
                          changeScreen(context);
                        },
                        color: Color(0xffffffff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Color(0xffffbf2f)),
                        ),
                        child: Text("See more reviews",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xffffbf2f),
                              fontSize: ScreenUtil().setSp(12),
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )))),
                Container(
                    // margin: EdgeInsets.only(
                    //     top: ScreenUtil().setHeight(644),
                    //     left: ScreenUtil().setWidth(24)),
                    width: ScreenUtil().setWidth(95),
                    height: ScreenUtil().setHeight(30),
                    child: RaisedButton(
                        onPressed: () {},
                        color: Color(0xffffbf2f),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("Go to course",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xffffffff),
                              fontSize: ScreenUtil().setSp(12),
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )))),
              ],
            ),
          ),
          Container(
              width: ScreenUtil().setWidth(312),
              height: 0,
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(16),bottom: ScreenUtil().setHeight(20)),
              decoration: new BoxDecoration(
                border: Border.all(color: Color(0xFFEEEEEE)),
              ))
        ],
      ),
    );
  }
}
