import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/industry_database.dart';
import 'package:firebase_core/firebase_core.dart';
class ListReviewCourse extends StatefulWidget {
  final String courseReviewid;
  ListReviewCourse(this.courseReviewid);
  @override
  _ListReviewCourseState createState() => _ListReviewCourseState(courseReviewid);
}

class _ListReviewCourseState extends State<ListReviewCourse> {
  _ListReviewCourseState(this.courseReviewid);
  final String courseReviewid;
  List listReview;
  final DatabaseManager courseReviewDatabase = DatabaseManager();
  @override
  void initState() {
    super.initState();
      fetchData();
    
    
  }
  void fetchData() async{
    final List resultant =  await this.courseReviewDatabase.getReview(this.courseReviewid);
    setState(() {
        listReview = resultant;
      });
  }
  void udpateData(List newData){
    setState((){
      listReview = newData;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(listReview == null) {return Center(child: Text('loading'),);} 
    else  return Container(
      height: 300,
      child: ListView.builder(
          itemCount: listReview.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(24),top:ScreenUtil().setHeight(12)),
              child :Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listReview[index]['user'],
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff000000),
                        fontSize: ScreenUtil().setSp(13),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  Row(children: [
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
                    Text(listReview[index]['time'],
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff303030),
                          fontSize: ScreenUtil().setSp(10),
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,


                        )),

                  ],),
                  Container(
                    margin: EdgeInsets.only(top:ScreenUtil().setHeight(5),bottom: ScreenUtil().setHeight(5)),
                    width: ScreenUtil().setWidth(275),
                    child: Text(listReview[index]['reviewText'],
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff000000),
                          fontSize: ScreenUtil().setSp(12),
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,

                        )
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(12)),
                        child: Text("Find this review helpful?",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff303030),
                              fontSize: ScreenUtil().setSp(10),
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                        // margin: EdgeInsets.only(
                        //     top: ScreenUtil().setHeight(12),
                        //     bottom: ScreenUtil().setHeight(14)),
                        width: ScreenUtil().setWidth(16),
                        height: ScreenUtil().setHeight(16),
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/like_icon.png"),
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Text(listReview[index]['upvote'].toString(),
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xffffbf2f),
                            fontSize: ScreenUtil().setSp(11),
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          )),
                    ],
                  ),
                  Container(
                      width: ScreenUtil().setWidth(275),
                      height: 0,
                      margin:
                      EdgeInsets.only(top: ScreenUtil().setHeight(16)),
                      decoration: new BoxDecoration(
                        border: Border.all(color: Color(0xFFEEEEEE)),
                      )),

                ],
              ),
            );
          }
),
    );
  }
}