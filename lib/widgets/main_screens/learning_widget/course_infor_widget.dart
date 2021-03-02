
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrouseInforWidget extends StatelessWidget {
  final Map courseInfor;
  CrouseInforWidget(this.courseInfor);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(24)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
            child: Text("Student feedback",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,


                )
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(courseInfor['star'].toString(),
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xffffbf2f),
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,


                  )
              ),
              Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(4),left: ScreenUtil().setWidth(6)),
                child: Text("Course rating",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xffffbf2f),
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )
                ),
              ),

            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(187),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          color: Color(0xffeaeaea),
                          borderRadius: BorderRadius.circular(6)
                      )
                  ),
                    Container(
                        width: ScreenUtil().setWidth(187*58/100),
                        height: ScreenUtil().setHeight(6),
                        decoration: new BoxDecoration(
                            color: Color(0xffffbf2f),
                            borderRadius: BorderRadius.circular(6)
                        )
                    ),
                  ]
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
                child: Text("58%",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,


                    )
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(
                    children: [
                      Container(
                          width: ScreenUtil().setWidth(187),
                          height: ScreenUtil().setHeight(6),
                          decoration: new BoxDecoration(
                              color: Color(0xffeaeaea),
                              borderRadius: BorderRadius.circular(6)
                          )
                      ),
                      Container(
                          width: ScreenUtil().setWidth(187*33/100),
                          height: ScreenUtil().setHeight(6),
                          decoration: new BoxDecoration(
                              color: Color(0xffffbf2f),
                              borderRadius: BorderRadius.circular(6)
                          )
                      ),
                    ]
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
                child: Text("33%",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,


                    )
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(
                    children: [
                      Container(
                          width: ScreenUtil().setWidth(187),
                          height: ScreenUtil().setHeight(6),
                          decoration: new BoxDecoration(
                              color: Color(0xffeaeaea),
                              borderRadius: BorderRadius.circular(6)
                          )
                      ),
                      Container(
                          width: ScreenUtil().setWidth(187*7/100),
                          height: ScreenUtil().setHeight(6),
                          decoration: new BoxDecoration(
                              color: Color(0xffffbf2f),
                              borderRadius: BorderRadius.circular(6)
                          )
                      ),
                    ]
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
                child: Text("7%",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,


                    )
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(
                    children: [
                      Container(
                          width: ScreenUtil().setWidth(187),
                          height: ScreenUtil().setHeight(6),
                          decoration: new BoxDecoration(
                              color: Color(0xffeaeaea),
                              borderRadius: BorderRadius.circular(6)
                          )
                      ),
                      Container(
                          width: ScreenUtil().setWidth(187*1/100),
                          height: ScreenUtil().setHeight(6),
                          decoration: new BoxDecoration(
                              color: Color(0xffffbf2f),
                              borderRadius: BorderRadius.circular(6)
                          )
                      ),
                    ]
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
                child: Text("1%",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,


                    )
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Stack(
                    children: [
                      Container(
                          width: ScreenUtil().setWidth(187),
                          height: ScreenUtil().setHeight(6),
                          decoration: new BoxDecoration(
                              color: Color(0xffeaeaea),
                              borderRadius: BorderRadius.circular(6)
                          )
                      ),
                      Container(
                          width: ScreenUtil().setWidth(187*1/100),
                          height: ScreenUtil().setHeight(6),
                          decoration: new BoxDecoration(
                              color: Color(0xffffbf2f),
                              borderRadius: BorderRadius.circular(6)
                          )
                      ),
                    ]
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
              Text("1%",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,


                  )
              )
            ],
          ),
          Text(courseInfor['name']),
        ],
      ),
    );

  }
}