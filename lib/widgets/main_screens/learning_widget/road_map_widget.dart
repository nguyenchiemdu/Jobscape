import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_app/models/users_database.dart';
import './road_map_item_widget.dart';
import 'package:bordered_text/bordered_text.dart';
import 'list_skill_widget.dart';
import 'package:learning_app/models/industry_database.dart';

class RoadMapWidget extends StatefulWidget {
  final String path;
  final Map roadMapData;
  RoadMapWidget(this.roadMapData, this.path);

  @override
  _RoadMapWidgetState createState() => _RoadMapWidgetState(roadMapData, path);
}

class _RoadMapWidgetState extends State<RoadMapWidget> {
  Map firstRoadMapItem;
  final String path;
  final Map roadMapData;
  List listRoadMap;
  bool isNewUser = false;
  List<Widget> listRoadMapWidget = [];
  _RoadMapWidgetState(this.roadMapData, this.path);
  void startJourney(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListSkillWidget(this.firstRoadMapItem)),
    );
    Map<String, dynamic> data = {'isNewUser': false};
    await UserDatabaseService().uploadProfile(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // addRoadmap();
  }

  void getData() async {
    List temp = await DatabaseManager().getListRoadMap(path);
    bool res = await UserDatabaseService().getTypeOfUser();
    // print(jsonEncode(temp));
    setState(() {
      listRoadMap = temp;
      listRoadMapWidget = listRoadMap
          .map((item) => RoadMapItem(listRoadMap.indexOf(item) + 1, item))
          .toList();
      isNewUser = res;
    });
    // print('listRoadMapWidget'+listRoadMapWidget.toString());
    firstRoadMapItem = listRoadMap[0];
  }

  void addRoadmap() async {
    List listRoadMap = [
      {
        "content":
            "Content Content Content Content Content Content Content Content Content Content Content Content Content Content",
        "name": "Must-have",
        'order': 1
      },
      {
        "content":
            "Content Content Content Content Content Content Content Content Content Content Content Content Content Content",
        "name": "Fast Track",
        'order': 2
      },
      {
        "content":
            "Content Content Content Content Content Content Content Content Content Content Content Content Content Content",
        "name": "Advanced",
        'order': 3
      }
    ];
    for (Map<String, dynamic> roadMap in listRoadMap) {
      await DatabaseManager().addRoadmap(roadMap, path: path);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(roadMapData.toString());
    return Scaffold(
      body: Container(
          child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Container(
              height: ScreenUtil().setHeight(270),
              width: ScreenUtil().setWidth(360),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.white.withOpacity(0.9), BlendMode.dstATop),
                      image: NetworkImage(
                        roadMapData['imgSrc'],
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(50),
                        left: ScreenUtil().setWidth(24)),
                    child: ClipOval(
                      child: Material(
                        color: Colors.white, // button color
                        child: InkWell(
                          splashColor: Color(0xffffbf2f), // inkwell color
                          child: SizedBox(
                              width: 36,
                              height: 36,
                              child: Icon(Icons.arrow_back)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(68)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Positioned(
                              top: 4,
                              child: BorderedText(
                                strokeWidth: 1,
                                strokeColor: Color(0xffffbf2f),
                                child: Text(roadMapData['name'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Colors.transparent,
                                      fontSize: ScreenUtil().setSp(26),
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.52,
                                    )),
                              ),
                            ),
                            // Solid text as fill.
                            Text(roadMapData['name'],
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xffffbf2f),
                                  fontSize: ScreenUtil().setSp(26),
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.52,
                                )),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            // DraggableScrollableSheet(
            //   initialChildSize: 0.7,
            //   maxChildSize: 1,
            //   builder:(BuildContext context,ScrollController scrollController) {
            //     return
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(233)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    // height: 700,

                    // child: ListView.builder(
                    //   itemCount: 1,
                    //   controller: scrollController,
                    //   itemBuilder:(context,index) {
                    //     return
                    child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(37),
                          bottom: ScreenUtil().setHeight(30)),
                      child: Text("Recommended by 100+ professionals/advisors",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          )),
                    ),
                    Column(
                      children: listRoadMapWidget,
                      // [
                      //   RoadMapItem(1, roadMapData['listRoadMap'][0]),
                      //   RoadMapItem(2, roadMapData['listRoadMap'][1]),
                      //   RoadMapItem(3, roadMapData['listRoadMap'][2]),
                      // ],
                    ),
                    //Cái thứ 3 bên trên anh làm thêm vào cho nó giống của design nha
                    Container(
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(70),
                      color: Colors.white,
                    )
                    //Cho cái Container bên trên là để cho cái bottom Start Journey không che vào
                  ],
                )),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(198),
              left: ScreenUtil().setWidth(145),
              child: Center(
                child: Container(
                  height: ScreenUtil().setHeight(70),
                  width: ScreenUtil().setWidth(70),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/recommend_icon.png"),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            isNewUser
                ? Positioned(
                    bottom: 0,
                    child: Container(
                        width: ScreenUtil().setWidth(360),
                        height: ScreenUtil().setHeight(152),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0, -3),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(20),
                                  left: ScreenUtil().setWidth(24)),
                              child: Text(roadMapData['name'],
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff000000),
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(4),
                                  left: ScreenUtil().setWidth(24)),
                              child: Text(
                                  "1 - 2 câu mô tả gì đó cho người dùng hiểu rõ",
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff000000),
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  )),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(16),
                                    left: ScreenUtil().setWidth(24)),
                                width: ScreenUtil().setWidth(312),
                                height: ScreenUtil().setHeight(50),
                                child: RaisedButton(
                                    onPressed: () {
                                      showAlertDialog(
                                          context, roadMapData['name'], () {
                                        startJourney(context);
                                      });
                                    },
                                    color: Color(0xffffbf2f),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text("Start Journey ",
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          color: Color(0xffffffff),
                                          fontSize: ScreenUtil().setSp(18),
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        )))),
                          ],
                        )),
                  )
                : Container(),
          ])),
    );
  }
}

showAlertDialog(BuildContext context, String journey, Function startJourney) {
  Widget cancelButton = FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text("Cancel"));
  // set up the button
  Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
        startJourney();
      });

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
        "Would you like to start your journey to become a " +
            journey +
            " with us now?",
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          color: Color(0xff000000),
          fontSize: ScreenUtil().setSp(14),
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
        )),
    actions: [
      cancelButton,
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
