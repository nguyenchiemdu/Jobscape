import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/widgets/login_screens/confirm_email.dart';

List teamList = [
  {
    "name": "Nguyen Hai Phong",
    "position": "R&D",
    "facebook": "https://www.facebook.com/thanhlong.vu2000/",
    "email": "longvu2000.hust@gmai.com",
    "image_source":
        "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/Team%2FH%E1%BA%A3i%20Phong.jpg?alt=media&token=b6f95b12-0ae2-4f6a-83d1-55022b244f05"
  },
  {
    "name": "Ninh Quynh Anh",
    "position": "R&D",
    "facebook": "https://www.facebook.com/thanhlong.vu2000/",
    "email": "longvu2000.hust@gmai.com",
    "image_source":
        "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/Team%2FQuynh%20Anh.jpg?alt=media&token=2978b944-09eb-4cc4-99e5-c5ec8b0aeb73"
  },
  {
    "name": "Vu Thanh Long",
    "position": "Software Engineer",
    "facebook": "https://www.facebook.com/thanhlong.vu2000/",
    "email": "longvu2000.hust@gmai.com",
    "image_source":
        "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/Team%2FLong.jpg?alt=media&token=f9e88cda-c4ab-45bc-90cb-8f86bdae39e5",
  },
  {
    "name": "Nguyen Chiem Du",
    "position": "Software Engineer",
    "facebook": "https://www.facebook.com/thanhlong.vu2000/",
    "email": "longvu2000.hust@gmai.com",
    "image_source":
        "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/Team%2Fchiemdu.png?alt=media&token=a1603015-b9c8-4592-8c24-07caef859601",
  },
  {
    "name": "Truong Vo Truc Nhu",
    "position": "UI/UX Designer",
    "facebook": "https://www.facebook.com/thanhlong.vu2000/",
    "email": "longvu2000.hust@gmai.com",
    "image_source":"https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/Team%2FC%20Nh%C6%B0.jpg?alt=media&token=a14db82d-c68c-4740-938e-8658871fb873"},
];

class OurTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height) / 2;
    // final double itemWidth = size.width / 2;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: ScreenUtil().setWidth(312),
          margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(30),
              bottom: ScreenUtil().setHeight(6)),
          child: Text("Our Team",
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                color: Color(0xff000000),
                fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false),
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              )),
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
              width: ScreenUtil().setWidth(312),
              // margin: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: ScreenUtil().setHeight(75),
                    width: ScreenUtil().setWidth(151),
                    child: Stack(children: [
                      Positioned(
                        left: ScreenUtil().setWidth(19),
                        top: ScreenUtil().setHeight(8),
                        child: Container(
                          width: ScreenUtil().setWidth(132),
                          height: ScreenUtil().setHeight(64),
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x26454545),
                                  offset: Offset(0, 5),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(22),
                                    bottom: 3,
                                    left: ScreenUtil().setWidth(39)),
                                child: Text(teamList[0]['name'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(39)),
                                child: Text(teamList[0]['position'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil().setHeight(15),
                        child: Container(
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(50),
                          decoration: new BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(teamList[0]['image_source']),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                      // Positioned(
                      //   left: ScreenUtil().setWidth(90),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.only(right: 4),
                      //         width: ScreenUtil().setWidth(26),
                      //         height: ScreenUtil().setHeight(26),
                      //         decoration: new BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Color(0x26454545),
                      //                   offset: Offset(0, 5),
                      //                   blurRadius: 6,
                      //                   spreadRadius: 0)
                      //             ],
                      //             image: DecorationImage(
                      //               image: AssetImage(
                      //                   "assets/images/facebook_icon.png"),
                      //               fit: BoxFit.fill,
                      //             )),
                      //       ),
                      //       Container(
                      //         width: ScreenUtil().setWidth(26),
                      //         height: ScreenUtil().setHeight(26),
                      //         decoration: new BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Color(0x26454545),
                      //                   offset: Offset(0, 5),
                      //                   blurRadius: 6,
                      //                   spreadRadius: 0)
                      //             ],
                      //             image: DecorationImage(
                      //               image: AssetImage(
                      //                   "assets/images/google_icon.png"),
                      //               fit: BoxFit.fill,
                      //             )),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ]),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(75),
                    width: ScreenUtil().setWidth(151),
                    child: Stack(children: [
                      Positioned(
                        left: ScreenUtil().setWidth(19),
                        top: ScreenUtil().setHeight(8),
                        child: Container(
                          width: ScreenUtil().setWidth(132),
                          height: ScreenUtil().setHeight(64),
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x26454545),
                                  offset: Offset(0, 5),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(22),
                                    bottom: 3,
                                    left: ScreenUtil().setWidth(39)),
                                child: Text(teamList[1]['name'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(39)),
                                child: Text(teamList[1]['position'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil().setHeight(15),
                        child: Container(
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(50),
                          decoration: new BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(teamList[1]['image_source']),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                      // Positioned(
                      //   left: ScreenUtil().setWidth(90),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.only(right: 4),
                      //         width: ScreenUtil().setWidth(26),
                      //         height: ScreenUtil().setHeight(26),
                      //         decoration: new BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Color(0x26454545),
                      //                   offset: Offset(0, 5),
                      //                   blurRadius: 6,
                      //                   spreadRadius: 0)
                      //             ],
                      //             image: DecorationImage(
                      //               image: AssetImage(
                      //                   "assets/images/facebook_icon.png"),
                      //               fit: BoxFit.fill,
                      //             )),
                      //       ),
                      //       Container(
                      //         width: ScreenUtil().setWidth(26),
                      //         height: ScreenUtil().setHeight(26),
                      //         decoration: new BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Color(0x26454545),
                      //                   offset: Offset(0, 5),
                      //                   blurRadius: 6,
                      //                   spreadRadius: 0)
                      //             ],
                      //             image: DecorationImage(
                      //               image: AssetImage(
                      //                   "assets/images/google_icon.png"),
                      //               fit: BoxFit.fill,
                      //             )),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
              width: ScreenUtil().setWidth(312),
              // margin: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: ScreenUtil().setHeight(75),
                    width: ScreenUtil().setWidth(151),
                    child: Stack(children: [
                      Positioned(
                        left: ScreenUtil().setWidth(19),
                        top: ScreenUtil().setHeight(8),
                        child: Container(
                          width: ScreenUtil().setWidth(132),
                          height: ScreenUtil().setHeight(64),
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x26454545),
                                  offset: Offset(0, 5),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(22),
                                    bottom: 3,
                                    left: ScreenUtil().setWidth(39)),
                                child: Text(teamList[2]['name'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(39)),
                                child: Text(teamList[2]['position'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil().setHeight(15),
                        child: Container(
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(50),
                          decoration: new BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    teamList[2]['image_source']),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                      // Positioned(
                      //   left: ScreenUtil().setWidth(90),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.only(right: 4),
                      //         width: ScreenUtil().setWidth(26),
                      //         height: ScreenUtil().setHeight(26),
                      //         decoration: new BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Color(0x26454545),
                      //                   offset: Offset(0, 5),
                      //                   blurRadius: 6,
                      //                   spreadRadius: 0)
                      //             ],
                      //             image: DecorationImage(
                      //               image: AssetImage(
                      //                   "assets/images/facebook_icon.png"),
                      //               fit: BoxFit.fill,
                      //             )),
                      //       ),
                      //       Container(
                      //         width: ScreenUtil().setWidth(26),
                      //         height: ScreenUtil().setHeight(26),
                      //         decoration: new BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Color(0x26454545),
                      //                   offset: Offset(0, 5),
                      //                   blurRadius: 6,
                      //                   spreadRadius: 0)
                      //             ],
                      //             image: DecorationImage(
                      //               image: AssetImage(
                      //                   "assets/images/google_icon.png"),
                      //               fit: BoxFit.fill,
                      //             )),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ]),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(75),
                    width: ScreenUtil().setWidth(151),
                    child: Stack(children: [
                      Positioned(
                        left: ScreenUtil().setWidth(19),
                        top: ScreenUtil().setHeight(8),
                        child: Container(
                          width: ScreenUtil().setWidth(132),
                          height: ScreenUtil().setHeight(64),
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x26454545),
                                  offset: Offset(0, 5),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(22),
                                    bottom: 3,
                                    left: ScreenUtil().setWidth(39)),
                                child: Text(teamList[3]['name'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(39)),
                                child: Text(teamList[3]['position'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil().setHeight(15),
                        child: Container(
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(50),
                          decoration: new BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(teamList[3]['image_source']),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                      // Positioned(
                      //   left: ScreenUtil().setWidth(90),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.only(right: 4),
                      //         width: ScreenUtil().setWidth(26),
                      //         height: ScreenUtil().setHeight(26),
                      //         decoration: new BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Color(0x26454545),
                      //                   offset: Offset(0, 5),
                      //                   blurRadius: 6,
                      //                   spreadRadius: 0)
                      //             ],
                      //             image: DecorationImage(
                      //               image: AssetImage(
                      //                   "assets/images/facebook_icon.png"),
                      //               fit: BoxFit.fill,
                      //             )),
                      //       ),
                      //       Container(
                      //         width: ScreenUtil().setWidth(26),
                      //         height: ScreenUtil().setHeight(26),
                      //         decoration: new BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                   color: Color(0x26454545),
                      //                   offset: Offset(0, 5),
                      //                   blurRadius: 6,
                      //                   spreadRadius: 0)
                      //             ],
                      //             image: DecorationImage(
                      //               image: AssetImage(
                      //                   "assets/images/google_icon.png"),
                      //               fit: BoxFit.fill,
                      //             )),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ]),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                height: ScreenUtil().setHeight(75),
                width: ScreenUtil().setWidth(151),
                child: Stack(children: [
                  Positioned(
                    left: ScreenUtil().setWidth(19),
                    top: ScreenUtil().setHeight(8),
                    child: Container(
                      width: ScreenUtil().setWidth(132),
                      height: ScreenUtil().setHeight(64),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x26454545),
                              offset: Offset(0, 5),
                              blurRadius: 6,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(22),
                                bottom: 3,
                                left: ScreenUtil().setWidth(39)),
                            child: Text(teamList[4]['name'],
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff000000),
                                  fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(39)),
                            child: Text(teamList[4]['position'],
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff000000),
                                  fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: ScreenUtil().setHeight(15),
                    child: Container(
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                      decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(teamList[4]['image_source']),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                  // Positioned(
                  //   left: ScreenUtil().setWidth(90),
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(right: 4),
                  //         width: ScreenUtil().setWidth(26),
                  //         height: ScreenUtil().setHeight(26),
                  //         decoration: new BoxDecoration(
                  //             boxShadow: [
                  //               BoxShadow(
                  //                   color: Color(0x26454545),
                  //                   offset: Offset(0, 5),
                  //                   blurRadius: 6,
                  //                   spreadRadius: 0)
                  //             ],
                  //             image: DecorationImage(
                  //               image: AssetImage(
                  //                   "assets/images/facebook_icon.png"),
                  //               fit: BoxFit.fill,
                  //             )),
                  //       ),
                  //       Container(
                  //         width: ScreenUtil().setWidth(26),
                  //         height: ScreenUtil().setHeight(26),
                  //         decoration: new BoxDecoration(
                  //             boxShadow: [
                  //               BoxShadow(
                  //                   color: Color(0x26454545),
                  //                   offset: Offset(0, 5),
                  //                   blurRadius: 6,
                  //                   spreadRadius: 0)
                  //             ],
                  //             image: DecorationImage(
                  //               image:
                  //                   AssetImage("assets/images/google_icon.png"),
                  //               fit: BoxFit.fill,
                  //             )),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
