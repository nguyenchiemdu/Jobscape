import 'package:flutter/material.dart';
import 'list_course_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkillItem extends StatelessWidget {
  final Map skillItem;
  SkillItem(this.skillItem);

  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ListCourseWidget(skillItem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(7),top: ScreenUtil().setHeight(20),left:ScreenUtil().setWidth(7),),
        width: 149,
        height: 190,
        decoration: new BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(
              color: Color(0x26454545),
              offset: Offset(0,3),
              blurRadius: 6,
              spreadRadius: 0
          ) ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){changeScreen(context);},
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(9),right: ScreenUtil().setWidth(9), left: ScreenUtil().setWidth(9)),
              width: ScreenUtil().setWidth(131),
              height: ScreenUtil().setHeight(99),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw7L7A7_u4dd2X675qYCf-vIS0-OJzC64uHQ&usqp=CAU"),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(12),bottom: ScreenUtil().setHeight(4), left: ScreenUtil().setWidth(9)),
            child: Text(skillItem['name'],
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff000000),
                  fontSize: ScreenUtil().setSp(15),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,


                )
            ),
          ),
          Stack(
            children:[
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
              width: ScreenUtil().setWidth(131),
              height: ScreenUtil().setHeight(57),
              child: Text("Content - Content - Content\nContent",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff888888),
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,


                  )
              ),
            ),
              Positioned(
                // left: ScreenUtil().setWidth(110),
                // top: ScreenUtil().setHeight(28),
                right: ScreenUtil().setWidth(1),
                bottom: ScreenUtil().setHeight(8),

                child: InkWell(
                  onTap: (){changeScreen(context);},
                  child: Container(
                    width: ScreenUtil().setWidth(32),
                    height: ScreenUtil().setHeight(32),
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/start_learn_icon.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
          ]
          )

        ],
      )

      // child: InkWell(
      //   onTap: () {
      //     changeScreen(context);
      //   },
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(roadMapItem['listSkill'][index]['name']),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
