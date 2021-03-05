import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'course_infor_widget.dart';
import 'list_course_review_widget.dart';
import 'package:learning_app/models/industry_database.dart';
import 'add_coursereview_widget.dart';
class CrouseReviewScreen extends StatelessWidget {
  final Map courseItem;
  final DatabaseManager industryDataBase = DatabaseManager();
  CrouseReviewScreen(this.courseItem);
  void addReview(){
    Map review = {
      'user' : 'Nguyen Chiem Du',
      'reviewText' : 'This Course is very good',
      'upvote' : 200,
      'downvote' : 0,
      'star' : 5,
      'time' : 'a month ago'
    };
    // print(jsonEncode(review).toString());
    // industryDataBase.getReview(courseItem['courseReviewId']);
    // industryDataBase.upLoadReview(courseItem['courseReviewId']);

  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          Stack(
            children: [
              Container(
                height: ScreenUtil().setHeight(270),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xfffafafa),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                        fit: BoxFit.cover)),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(8),
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
                    // Text(roadMapItem['name']),
                    Container(
                        margin:
                        EdgeInsets.only(top: ScreenUtil().setHeight(24)),
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
                                  child: Text(courseItem['name'],
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(23),
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: -0.52,
                                      )),
                                ),
                              ),
                              // Solid text as fill.
                              Text(courseItem['name'],
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xffffbf2f),
                                    fontSize: ScreenUtil().setSp(23),
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.52,
                                  )),
                            ],
                          ),
                        )),
                  ],
                ),
                // RaisedButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   child: Icon(Icons.arrow_back),
                // ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(122)),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Colors.white,
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CrouseInforWidget(this.courseItem),
                  AddReviewFormWidget(courseItem['path']),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(30),left: ScreenUtil().setWidth(24)),
                    child: Text("Reviews",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff000000),
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  ),
                  ListReviewCourse(courseItem['courseReviewId'],courseItem['path']),
                  // RaisedButton(
                  //   onPressed: (){addReview();},
                  //   child: Text('Get review'),
                  //   )
                ],

              ),
            ),]
          ),
          // Container(
          //   child: Stack(
          //     children: [
          //       Container(
          //         height: ScreenUtil().setHeight(270),
          //         width: double.infinity,
          //         decoration: BoxDecoration(
          //             color: Color(0xfffafafa),
          //             image: DecorationImage(
          //                 image: NetworkImage(
          //                     "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
          //                 fit: BoxFit.cover)),
          //         child:
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               margin: EdgeInsets.only(
          //                   top: ScreenUtil().setHeight(8),
          //                   left: ScreenUtil().setWidth(24)),
          //               child: ClipOval(
          //                 child: Material(
          //                   color: Colors.white, // button color
          //                   child: InkWell(
          //                     splashColor: Color(0xffffbf2f), // inkwell color
          //                     child: SizedBox(
          //                         width: 36,
          //                         height: 36,
          //                         child: Icon(Icons.arrow_back)),
          //                     onTap: () {
          //                       Navigator.pop(context);
          //                     },
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             // Text(roadMapItem['name']),
          //             Container(
          //                 margin:
          //                 EdgeInsets.only(top: ScreenUtil().setHeight(24)),
          //                 child: Align(
          //                   alignment: Alignment.center,
          //                   child: Stack(
          //                     children: <Widget>[
          //                       // Stroked text as border.
          //                       Positioned(
          //                         top: 4,
          //                         child: BorderedText(
          //                           strokeWidth: 1,
          //                           strokeColor: Color(0xffffbf2f),
          //                           child: Text(skillItem['name'],
          //                               style: TextStyle(
          //                                 fontFamily: 'SFProDisplay',
          //                                 color: Colors.white,
          //                                 fontSize: ScreenUtil().setSp(23),
          //                                 fontWeight: FontWeight.w900,
          //                                 fontStyle: FontStyle.normal,
          //                                 letterSpacing: -0.52,
          //                               )),
          //                         ),
          //                       ),
          //                       // Solid text as fill.
          //                       Text(skillItem['name'],
          //                           style: TextStyle(
          //                             fontFamily: 'SFProDisplay',
          //                             color: Color(0xffffbf2f),
          //                             fontSize: ScreenUtil().setSp(23),
          //                             fontWeight: FontWeight.w900,
          //                             fontStyle: FontStyle.normal,
          //                             letterSpacing: -0.52,
          //                           )),
          //                     ],
          //                   ),
          //                 )),
          //           ],
          //         ),
          //         // RaisedButton(
          //         //   onPressed: () {
          //         //     Navigator.pop(context);
          //         //   },
          //         //   child: Icon(Icons.arrow_back),
          //         // ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(top: ScreenUtil().setHeight(122)),
          //         padding: EdgeInsets.only(top:ScreenUtil().setHeight(16),left:ScreenUtil().setWidth(17),right:ScreenUtil().setWidth(17)),
          //         width: double.infinity,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(24),
          //             topRight: Radius.circular(24),
          //           ),
          //           color: Colors.white,
          //         ),
          //         height: ScreenUtil().setHeight(596),
          //         child: ListView.builder(
          //             padding: const EdgeInsets.all(8),
          //             itemCount: skillItem['listCourse'].length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return CourseItemWidget(skillItem['listCourse'][index]);
          //             }),
          //       ),
          //       Container(
          //           margin: EdgeInsets.only(
          //               top: ScreenUtil().setHeight(644),
          //               left: ScreenUtil().setWidth(24)),
          //           width: ScreenUtil().setWidth(312),
          //           height: ScreenUtil().setHeight(50),
          //           child: RaisedButton(
          //               onPressed: () {},
          //               color: Color(0xffffbf2f),
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(12),
          //               ),
          //               child: Text("Submit Proof",
          //                   style: TextStyle(
          //                     fontFamily: 'SFProDisplay',
          //                     color: Color(0xffffffff),
          //                     fontSize: ScreenUtil().setSp(18),
          //                     fontWeight: FontWeight.w700,
          //                     fontStyle: FontStyle.normal,
          //                   )))),
          //     ],
          //   ),
          // ),

        ),
      ),
    );
  }
}