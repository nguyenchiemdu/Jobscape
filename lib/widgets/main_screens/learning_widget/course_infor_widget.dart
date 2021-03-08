import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrouseInforWidget extends StatelessWidget {
  final Map courseInfor;
  Map star = new Map();
  CrouseInforWidget(this.courseInfor);
  void caculateStar() {
    int sum = 0;
    int numStar = 0;
    for (int i = 1; i <= 5; i++) {
      sum += courseInfor[i.toString()];
      numStar += courseInfor[i.toString()] * i;
    }
    for (int i = 1; i <= 5; i++) {
      if (sum != 0)
        star[i.toString()] = (courseInfor[i.toString()] / sum * 100).round();
      else
        star[i.toString()] = 0;
    }
    if (sum != 0)
      star['overall'] = (numStar / sum).toStringAsFixed(1);
    else
      star['overall'] = '0.0';
    // print(sum);
    // print(star.toString());
  }

  void upLoadCourse() {
    Map course = {
      "1": 1,
      "2": 10,
      "3": 20,
      "4": 200,
      "5": 1000,
      "price": 300,
      "review": 42347,
      "name": "Học HTML/CSS cơ bản qua bài tập thực tế",
      "link":
          "https://edumall.vn/courses/hoc-htmlcss-co-ban-qua-bai-tap-thuc-te",
      "recommender": "Nguyễn Chiếm Dự",
      "courseReviewId": "75moQh3yUBk0KZYTiwDc"
    };
  }

  @override
  Widget build(BuildContext context) {
    caculateStar();
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(10),
                top: ScreenUtil().setHeight(36)),
            child: Text("Student feedback",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(star['overall'],
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xffffbf2f),
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              Container(
                margin: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(4),
                    left: ScreenUtil().setWidth(6)),
                child: Text("Course rating",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xffffbf2f),
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(children: [
                  Container(
                      width: ScreenUtil().setWidth(187),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffeaeaea),
                          borderRadius: BorderRadius.circular(6))),
                  Container(
                      width: ScreenUtil().setWidth(187 * star['5'] / 100),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffffbf2f),
                          borderRadius: BorderRadius.circular(6))),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(6)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(7)),
                child: Text(star['5'].toString() + "%",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(children: [
                  Container(
                      width: ScreenUtil().setWidth(187),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffeaeaea),
                          borderRadius: BorderRadius.circular(6))),
                  Container(
                      width: ScreenUtil().setWidth(187 * star['4'] / 100),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffffbf2f),
                          borderRadius: BorderRadius.circular(6))),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(6)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(7)),
                child: Text(star['4'].toString() + "%",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(children: [
                  Container(
                      width: ScreenUtil().setWidth(187),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffeaeaea),
                          borderRadius: BorderRadius.circular(6))),
                  Container(
                      width: ScreenUtil().setWidth(187 * star['3'] / 100),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffffbf2f),
                          borderRadius: BorderRadius.circular(6))),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(6)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(7)),
                child: Text(star['3'].toString() + "%",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(children: [
                  Container(
                      width: ScreenUtil().setWidth(187),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffeaeaea),
                          borderRadius: BorderRadius.circular(6))),
                  Container(
                      width: ScreenUtil().setWidth(187 * star['2'] / 100),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffffbf2f),
                          borderRadius: BorderRadius.circular(6))),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(6)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(7)),
                child: Text(star['2'].toString() + "%",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(children: [
                  Container(
                      width: ScreenUtil().setWidth(187),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffeaeaea),
                          borderRadius: BorderRadius.circular(6))),
                  Container(
                      width: ScreenUtil().setWidth(187 * star['1'] / 100),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffffbf2f),
                          borderRadius: BorderRadius.circular(6))),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yellow_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(6)),
                // margin: EdgeInsets.only(
                //     top: ScreenUtil().setHeight(12),
                //     bottom: ScreenUtil().setHeight(14)),
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setHeight(12),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/grey_star_icon.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Text(star['1'].toString() + "%",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
