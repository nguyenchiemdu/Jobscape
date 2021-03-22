import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/widgets/main_screens/home_widget/progress.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/add_coursereview_widget.dart';
import './industry_slider_card.dart';
import 'package:learning_app/models/industry_database.dart';
import 'package:firebase_core/firebase_core.dart';
import './road_map_widget.dart';

class IndustryComponent extends StatefulWidget {
  final String fieldId;
  final Function changeScreen;
  IndustryComponent(this.fieldId, this.changeScreen);
  @override
  _IndustryComponentState createState() =>
      _IndustryComponentState(this.fieldId);
}

class _IndustryComponentState extends State<IndustryComponent> {
  final String fieldId;
  _IndustryComponentState(this.fieldId);
  dynamic industryField;
  final dbManager = DatabaseManager();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      fetDatabaseList();
    });
  }

  fetDatabaseList() async {
    dynamic resultant = await dbManager.getIndustryField(fieldId);
    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      await setState(() {
        industryField = resultant;
        // print('id la : '+industryField['id'].toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (industryField == null) {
      return Center(
        child: Text('Loading'),
      );
    } else {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(24),
                  top: ScreenUtil().setHeight(20)),
              width: ScreenUtil().setWidth(312),
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(industryField['fieldName'],
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(16),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(12),
                  left: ScreenUtil().setWidth(12),
                  top: ScreenUtil().setHeight(12)),
              width: ScreenUtil().setWidth(312),
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              margin: EdgeInsets.only(left: 24, right: 24),
              decoration: new BoxDecoration(
                  color: Color(0xfffffaf0),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setSp(4)),
                    child: Text(industryField['briefIntro'],
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff000000),
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setSp(4)),
                    child: RichText(
                        text: new TextSpan(children: [
                      new TextSpan(
                          text: "Job opportunities expected to rise ",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          )),
                      new TextSpan(
                          text: industryField['jobVacancies'].toString()+"%",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xffffbf2f),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      new TextSpan(
                          text: " by 2026",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          )),
                    ])),
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 12),
                    child: RichText(
                        text: new TextSpan(children: [
                      new TextSpan(
                          text: industryField['learningJourney'].toString(),
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xffffbf2f),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      new TextSpan(
                          text: " Learning Journeys to explore",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          )),
                    ])),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setSp(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 24,
                            height: 24,
                            margin: EdgeInsets.only(left: 5),
                            child: Image.asset("assets/images/money_icon.png")),
                        RichText(
                            text: new TextSpan(children: [
                          new TextSpan(
                              text: "Starting monthly salary ",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              )),
                          new TextSpan(
                              text: "\$" +
                                  industryField['startingSalary'].toString(),
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xffffbf2f),
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                        ])),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliderCard(industryField['id']),
            new Container(
                width: double.infinity,
                height: 0,
                margin:
                    EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24),
                decoration: new BoxDecoration(
                  border: Border.all(color: Color(0xFFEEEEEE)),
                ))
          ],
        ),
      );
    }
  }
}
