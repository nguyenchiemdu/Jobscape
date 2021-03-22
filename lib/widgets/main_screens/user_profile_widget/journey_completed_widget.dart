import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:learning_app/models/users_database.dart';

class JourneyCompleted extends StatefulWidget {


  @override
  _JourneyCompletedState createState() => _JourneyCompletedState();
}

class _JourneyCompletedState extends State<JourneyCompleted> {
  List listJourneyCompleted = [];
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      getData();
    }
  void getData() async {
    List res = await UserDatabaseService().getAllJourneyCompleted();
    setState(() {
          listJourneyCompleted = res;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: ScreenUtil().setHeight(28)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(14),left: ScreenUtil().setWidth(24)),
            child: Text("Your journey completed",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff000000),
                  fontSize: ScreenUtil().setSp(15,allowFontScalingSelf: false),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                )
            ),
          ),
    if (listJourneyCompleted.length != 0)
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
                width: ScreenUtil().setWidth(162),
                height: ScreenUtil().setHeight(107),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Color(0xffffd3a3),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
                  width: ScreenUtil().setWidth(324),
                  height: ScreenUtil().setHeight(130),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listJourneyCompleted.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right:ScreenUtil().setWidth(18)),
                        width: ScreenUtil().setWidth(130),
                        height: ScreenUtil().setHeight(130),
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image:
                            CachedNetworkImageProvider(listJourneyCompleted[index]['imgSrc']),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Text(listJourneyCompleted[index]['name']),
                      );
                    },
                  )
                ),
            ],
          ),
    if (listJourneyCompleted.length == 0)
          Center(
            child: Container(
            width: ScreenUtil().setWidth(312),
            child: RichText(
            text: new TextSpan(
            children: [
                new TextSpan(
                  text: "You currently have no completed journeys.",
                  style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff303030),
                  fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: false),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )
                ),
                new TextSpan(
                  text: " Explore our Learning Journey here!",
                  recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  },
                  style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xffffbf2f),
                  fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: false),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )
                ),
                ]
                )
          ),
          ),
          )



    ],
      ),
    );
  }
}