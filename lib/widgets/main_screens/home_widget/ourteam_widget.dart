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
        "https://scontent.fhan2-6.fna.fbcdn.net/v/t1.0-9/122993091_1786227968195384_6352613809980811447_o.jpg?_nc_cat=103&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=jYq9NRYwKJ0AX-7cpSX&_nc_ht=scontent.fhan2-6.fna&oh=6791f04318ed7e224d9f1f3280c18693&oe=606FB399"
  },
  {
    "name": "Ninh Quynh Anh",
    "position": "R&D",
    "facebook": "https://www.facebook.com/thanhlong.vu2000/",
    "email": "longvu2000.hust@gmai.com",
    "image_source":
        "https://scontent.fhan2-1.fna.fbcdn.net/v/t1.0-9/101821252_1506262619582014_7120640460323377320_o.jpg?_nc_cat=101&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=1op8yuie_J8AX9cHTVV&_nc_ht=scontent.fhan2-1.fna&oh=981e66c4f781f840b045e3da640df665&oe=606FA77E"
  },
  {
    "name": "Vu Thanh Long",
    "position": "Software Engineer",
    "facebook": "https://www.facebook.com/thanhlong.vu2000/",
    "email": "longvu2000.hust@gmai.com",
    "image_source":
        "https://kenh14cdn.com/203336854389633024/2020/11/16/photo-1-16055422352601266792499.jpg",
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
    "image_source":
        "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/157874471_2539810756314702_7734877179043287353_o.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=SOxfRhcgOiUAX__-GNU&_nc_ht=scontent.fhan2-2.fna&oh=997bf4949ba6d066068984c1ecd19ff7&oe=60703D8A",
  },
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
                fontSize: ScreenUtil().setSp(14),
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
                                      fontSize: ScreenUtil().setSp(11),
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
                                      fontSize: ScreenUtil().setSp(11),
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
                      Positioned(
                        left: ScreenUtil().setWidth(90),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 4),
                              width: ScreenUtil().setWidth(26),
                              height: ScreenUtil().setHeight(26),
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x26454545),
                                        offset: Offset(0, 5),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/facebook_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(26),
                              height: ScreenUtil().setHeight(26),
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x26454545),
                                        offset: Offset(0, 5),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/google_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ],
                        ),
                      ),
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
                                      fontSize: ScreenUtil().setSp(11),
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
                                      fontSize: ScreenUtil().setSp(11),
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
                      Positioned(
                        left: ScreenUtil().setWidth(90),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 4),
                              width: ScreenUtil().setWidth(26),
                              height: ScreenUtil().setHeight(26),
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x26454545),
                                        offset: Offset(0, 5),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/facebook_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(26),
                              height: ScreenUtil().setHeight(26),
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x26454545),
                                        offset: Offset(0, 5),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/google_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ],
                        ),
                      ),
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
                                      fontSize: ScreenUtil().setSp(11),
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
                                      fontSize: ScreenUtil().setSp(11),
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
                      Positioned(
                        left: ScreenUtil().setWidth(90),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 4),
                              width: ScreenUtil().setWidth(26),
                              height: ScreenUtil().setHeight(26),
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x26454545),
                                        offset: Offset(0, 5),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/facebook_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(26),
                              height: ScreenUtil().setHeight(26),
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x26454545),
                                        offset: Offset(0, 5),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/google_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ],
                        ),
                      ),
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
                                      fontSize: ScreenUtil().setSp(11),
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
                                      fontSize: ScreenUtil().setSp(11),
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
                      Positioned(
                        left: ScreenUtil().setWidth(90),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 4),
                              width: ScreenUtil().setWidth(26),
                              height: ScreenUtil().setHeight(26),
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x26454545),
                                        offset: Offset(0, 5),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/facebook_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(26),
                              height: ScreenUtil().setHeight(26),
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x26454545),
                                        offset: Offset(0, 5),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/google_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ],
                        ),
                      ),
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
                                  fontSize: ScreenUtil().setSp(11),
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
                                  fontSize: ScreenUtil().setSp(11),
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
                  Positioned(
                    left: ScreenUtil().setWidth(90),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 4),
                          width: ScreenUtil().setWidth(26),
                          height: ScreenUtil().setHeight(26),
                          decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x26454545),
                                    offset: Offset(0, 5),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/facebook_icon.png"),
                                fit: BoxFit.fill,
                              )),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(26),
                          height: ScreenUtil().setHeight(26),
                          decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x26454545),
                                    offset: Offset(0, 5),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ],
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/google_icon.png"),
                                fit: BoxFit.fill,
                              )),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
