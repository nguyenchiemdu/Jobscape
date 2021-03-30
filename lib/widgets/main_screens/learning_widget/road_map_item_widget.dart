import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'list_skill_widget.dart';

class RoadMapItem extends StatelessWidget {
  final bool isStarted;
  final int index;
  final Map roadMapData;
  final String imgScr;
  final bool isUnlocked;
  RoadMapItem(this.index, this.roadMapData, this.imgScr,this.isUnlocked,this.isStarted);
  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListSkillWidget(this.roadMapData, this.imgScr)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (isUnlocked && isStarted) changeScreen(context);
            },
            child: Container(
              width: ScreenUtil().setWidth(230),
              height: ScreenUtil().setHeight(116),
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image:isUnlocked ?  //Thay hàm khóa vào đây nha em
                  AssetImage("assets/images/mile_stone.png") : AssetImage("assets/images/milestone_lock.png"),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(6)),
            child: Text(index.toString() + ". " + roadMapData['name'],
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff000000),
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(6),),
                  // left: ScreenUtil().setWidth(28)),
              width: ScreenUtil().setWidth(275),
              child: Text(roadMapData['content'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff888888),
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  )),
            ),
          ),
          if (roadMapData['name'].toString().toLowerCase() != "destination")
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(12),
                bottom: ScreenUtil().setHeight(14)),
            width: ScreenUtil().setWidth(93),
            height: ScreenUtil().setHeight(65),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: isUnlocked ? //Hàm check khóa
                AssetImage("assets/images/next_icon.png") : AssetImage("assets/images/next_icon_lock.png"),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
    //   Container(
    //   margin: EdgeInsets.all(10),
    //   width: 110,
    //   height: 110,
    //   decoration: BoxDecoration(
    //     color: Colors.yellow,
    //   ),
    //   child: InkWell(
    //     onTap: () {
    //       changeScreen(context);
    //     },
    //     child: Row(
    //       children: [
    //         Text(
    //           index.toString(),
    //           style: TextStyle(color: Colors.blue, fontSize: 30),
    //         ),
    //         Text(roadMapData['name'])
    //       ],
    //     ),
    //   ),
    // );
  }
}
