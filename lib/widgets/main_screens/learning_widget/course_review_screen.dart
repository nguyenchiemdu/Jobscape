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
      body: Stack(
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
                      top: ScreenUtil().setHeight(50),
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
                            child: Container(
                              width: ScreenUtil().setWidth(300),
                              child: BorderedText(
                                strokeWidth: 1,
                                strokeColor: Color(0xffffbf2f),
                                child: Text(courseItem['name'],
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Colors.transparent,
                                      fontSize: ScreenUtil().setSp(23),
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.52,
                                    ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          // Solid text as fill.
                          Container(
                            width: ScreenUtil().setWidth(300),
                            child: Text(courseItem['name'],
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xffffbf2f),
                                  fontSize: ScreenUtil().setSp(23),
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.52,
                                ),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(170)),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: Colors.white,
            ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CrouseInforWidget(this.courseItem),
                AddReviewFormWidget(courseItem['path']),
                ListReviewCourse(courseItem['courseReviewId'],courseItem['path']),
                // RaisedButton(
                //   onPressed: (){addReview();},
                //   child: Text('Get review'),
                //   )
              ],

            ),
          ),
        ),]
      ),
    );
  }
}