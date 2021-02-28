import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './road_map_item_widget.dart';
import 'package:bordered_text/bordered_text.dart';
import 'list_skill_widget.dart';

class RoadMapWidget extends StatelessWidget {
  final Map roadMapData;
  Map firstRoadMapItem;
  RoadMapWidget(this.roadMapData);
  void startJourney(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListSkillWidget(this.firstRoadMapItem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    firstRoadMapItem = roadMapData['listRoadMap'][0];
    // print(roadMapData.toString());
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                height: ScreenUtil().setHeight(228),
                width: ScreenUtil().setWidth(360),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(4),
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
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(70)),
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
                                  child: Text("JOURNEY TO X POSITION",
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(26),
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: -0.52,
                                      )),
                                ),
                              ),
                              // Solid text as fill.
                              Text("JOURNEY TO X POSITION",
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
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(178)),
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
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(37)),
                        child: Text("Recommended by",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff000000),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                            )),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                        child: Text(roadMapData['name'],
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      RoadMapItem(1, roadMapData['listRoadMap'][0]),
                      RoadMapItem(2, roadMapData['listRoadMap'][1]),
                      RoadMapItem(3, roadMapData['listRoadMap'][2]),
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
                top: ScreenUtil().setHeight(150),
                left: ScreenUtil().setWidth(145),
                child: Center(
                  child: Container(
                    height: ScreenUtil().setHeight(70),
                    width: ScreenUtil().setWidth(70),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/recommend_icon.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
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
                                  startJourney(context);
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
              ),
            ])),

        // RoadMapItem(3,roadMapData['listRoadMap'][2]['name']),
      ),
    );
  }
}
