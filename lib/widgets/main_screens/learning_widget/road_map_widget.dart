import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './road_map_item_widget.dart';
import 'package:bordered_text/bordered_text.dart';


class RoadMapWidget extends StatelessWidget {
  final Map roadMapData;
  RoadMapWidget(this.roadMapData);
  @override
  Widget build(BuildContext context) {
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
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(4),left: ScreenUtil().setWidth(24)),
                  child: ClipOval(
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Color(0xffffbf2f), // inkwell color
                        child: SizedBox(width: 36, height: 36, child: Icon(Icons.arrow_back)),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(70)),
                  child:
                  Align(
                  alignment: Alignment.center,
                  child:Stack(
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
                              )
                          ),
                        ),
                      ),
                      // Solid text as fill.
                      Text("JOURNEY TO X POSITION",style
                          : TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xffffbf2f),
                        fontSize: ScreenUtil().setSp(26),
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.52,
                      )
                      ),
                    ],
                  ),)
                ),],
            ),
          ),
      // DraggableScrollableSheet(
      //   initialChildSize: 0.7,
      //   maxChildSize: 1,
      //   builder:(BuildContext context,ScrollController scrollController) {
      //     return
          Container(
              margin: EdgeInsets.only(top:ScreenUtil().setHeight(178)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    // height: 700,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    color: Colors.white,
                  ),
                  // child: ListView.builder(
                  //   itemCount: 1,
                  //   controller: scrollController,
                  //   itemBuilder:(context,index) {
                  //     return
                  child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:ScreenUtil().setHeight(37)),
                            child: Text("Recommended by",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,


                                )
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.only(top:ScreenUtil().setHeight(60)),
                          child: Text(roadMapData['name'],
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ),
                        RoadMapItem(1, roadMapData['listRoadMap'][0]),
                        RoadMapItem(2, roadMapData['listRoadMap'][1]),
                          RoadMapItem(2, roadMapData['listRoadMap'][1]),
                      ],
                    )
                  ),
                ),
              ),
          Positioned(
            top: ScreenUtil().setHeight(150),
            left: ScreenUtil().setWidth(150),
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
          )

          ])
        ),


          // RoadMapItem(3,roadMapData['listRoadMap'][2]['name']),
      ),
        );
  }
}
