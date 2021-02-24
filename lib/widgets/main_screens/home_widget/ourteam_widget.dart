import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/widgets/login_screens/confirm_email.dart';

List teamList = [
  {"name": "Vu Thanh Long",
    "position":"Flutter Developer",
    "facebook":"https://www.facebook.com/thanhlong.vu2000/",
    "email":"longvu2000.hust@gmai.com",
    "image_source":"https://kenh14cdn.com/203336854389633024/2020/11/16/photo-1-16055422352601266792499.jpg"
  },
  {"name": "Vu Thanh Long",
    "position":"Flutter Developer",
    "facebook":"https://www.facebook.com/thanhlong.vu2000/",
    "email":"longvu2000.hust@gmai.com",
    "image_source":"https://kenh14cdn.com/203336854389633024/2020/11/16/photo-1-16055422352601266792499.jpg"
  },
  {"name": "Vu Thanh Long",
    "position":"Flutter Developer",
    "facebook":"https://www.facebook.com/thanhlong.vu2000/",
    "email":"longvu2000.hust@gmai.com",
    "image_source":"https://kenh14cdn.com/203336854389633024/2020/11/16/photo-1-16055422352601266792499.jpg",
  },
  {"name": "Nhu Truong",
    "position":"Flutter Developer",
    "facebook":"https://www.facebook.com/thanhlong.vu2000/",
    "email":"longvu2000.hust@gmai.com",
    "image_source":"https://kenh14cdn.com/203336854389633024/2020/11/16/photo-1-16055422352601266792499.jpg",
  },
];
class OurTeam extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top:30,left:24),
          child: Text("Our Team",
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              )
          ),
        ),
        Container(
          height: 180,
          child: Container(
            margin: EdgeInsets.only(left:24),
            child: GridView.count(
              childAspectRatio:4.5/2,
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 1,
              // padding: EdgeInsets.all(10),
              children:
              List.generate(teamList.length, (index) {
                return Container(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Positioned(
                        left: 19,
                        top: 8,
                        child: Container(
                          width: 140,
                          height: 64,
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [BoxShadow(
                                color: Color(0x26454545),
                                offset: Offset(0,5),
                                blurRadius: 6,
                                spreadRadius: 0
                            )],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top:22, bottom: 3,left:39),
                                child: Text(teamList[index]['name'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left:39),
                                child: Text(teamList[index]['position'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top:15,
                        child:
                            Container(
                                decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.circular(12)),
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: NetworkImage(teamList[index]['image_source']),
                                ),
                              ),
                            )),
                      //   Container(
                      //         width: 50,
                      //           height: 50,
                      //           // width: 50,
                      //           // height: 50,
                      //           decoration: new BoxDecoration(
                      //               borderRadius: BorderRadius.circular(12),
                      //               image: DecorationImage(
                      //                 image: NetworkImage(
                      //                     teamList[index]['image_source']),
                      //                 fit: BoxFit.contain,
                      //               )),
                      //         ),
                      // ),
                      Positioned(
                        left: 90,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 4),
                              width: 26,
                              height: 26,
                              decoration: new BoxDecoration(
                                  boxShadow: [BoxShadow(
                                      color: Color(0x26454545),
                                      offset: Offset(0,5),
                                      blurRadius: 6,
                                      spreadRadius: 0
                                  )],
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/facebook_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Container(
                              width: 26,
                              height: 26,
                              decoration: new BoxDecoration(
                                  boxShadow: [BoxShadow(
                                      color: Color(0x26454545),
                                      offset: Offset(0,5),
                                      blurRadius: 6,
                                      spreadRadius: 0
                                  )],
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/google_icon.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ],
                        ),
                      ),


                    //   Container(
                    //   width: 151,
                    //   height: 72,
                    //     decoration: BoxDecoration(
                    //       color: Color(0xffffffff),
                    //       borderRadius: BorderRadius.circular(12),
                    //       boxShadow: [BoxShadow(
                    //           color: Color(0x26454545),
                    //           offset: Offset(0,5),
                    //           blurRadius: 6,
                    //           spreadRadius: 0
                    //       ) ],
                    //     ),
                    //   // margin: EdgeInsets.only(bottom: 18),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //         width: 50,
                    //         height: 50,
                    //         decoration: new BoxDecoration(
                    //             borderRadius: BorderRadius.circular(12),
                    //             image: DecorationImage(
                    //               image: NetworkImage(
                    //                   teamList[index]['image_source']),
                    //               fit: BoxFit.fill,
                    //             )),
                    //       ),
                    //       Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Container(
                    //                 width: 26,
                    //                 height: 26,
                    //                 decoration: new BoxDecoration(
                    //                     image: DecorationImage(
                    //                       image: AssetImage("assets/images/facebook_icon.png"),
                    //                       fit: BoxFit.fill,
                    //                     )),
                    //               ),
                    //               Container(
                    //                 width: 26,
                    //                 height: 26,
                    //                 decoration: new BoxDecoration(
                    //                     image: DecorationImage(
                    //                       image: AssetImage("assets/images/google_icon.png"),
                    //                       fit: BoxFit.fill,
                    //                     )),
                    //               ),
                    //             ],
                    //           ),
                    //           Container(
                    //               width: 132,
                    //               height: 64,
                    //               decoration: new BoxDecoration(
                    //                 color: Color(0xffffffff),
                    //                 borderRadius: BorderRadius.circular(12),
                    //                 boxShadow: [BoxShadow(
                    //                     color: Color(0x26454545),
                    //                     offset: Offset(0,5),
                    //                     blurRadius: 6,
                    //                     spreadRadius: 0
                    //                 ) ],
                    //               ),
                    //             child: Column(
                    //               children: [
                    //                 Text(teamList[index]['name'],
                    //                     style: TextStyle(
                    //                       fontFamily: 'SFProDisplay',
                    //                       color: Color(0xff000000),
                    //                       fontSize: 11,
                    //                       fontWeight: FontWeight.w500,
                    //                       fontStyle: FontStyle.normal,
                    //
                    //                     )
                    //                 ),
                    //                 Text(teamList[index]['position'],
                    //                     style: TextStyle(
                    //                       fontFamily: 'SFProDisplay',
                    //                       color: Color(0xff000000),
                    //                       fontSize: 11,
                    //                       fontWeight: FontWeight.w300,
                    //                       fontStyle: FontStyle.normal,
                    //                     )
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                      ]),
                );
              }),
            ),
          ),
        ),

      ],
    );

  }
}
