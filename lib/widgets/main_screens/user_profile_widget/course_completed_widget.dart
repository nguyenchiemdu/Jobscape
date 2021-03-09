import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class CourseCompleted extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: ScreenUtil().setHeight(28)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(14),left: ScreenUtil().setWidth(24)),
            child: Text("Your courses completed",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff000000),
                  fontSize: ScreenUtil().setSp(15,allowFontScalingSelf: false),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                )
            ),
          ),
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
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right:ScreenUtil().setWidth(18)),
                        width: ScreenUtil().setWidth(130),
                        height: ScreenUtil().setHeight(130),
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage("assets/images/getjob.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  )),
            ],
          ),

        ],
      ),
    );
  }
}