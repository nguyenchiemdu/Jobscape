import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/industry_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListReviewCourse extends StatefulWidget {
  final String courseReviewid;
  final String path;
  ListReviewCourse(this.courseReviewid, this.path);
  @override
  _ListReviewCourseState createState() =>
      _ListReviewCourseState(courseReviewid);
}

class _ListReviewCourseState extends State<ListReviewCourse> {
  _ListReviewCourseState(this.courseReviewid);
  final String courseReviewid;
  List listReview;
  bool like = false; 
  List<bool> stateUpvote = [];
  final DatabaseManager courseReviewDatabase = DatabaseManager();
  final UserDatabaseService userDatabaseService = UserDatabaseService();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final List resultant =
        await this.courseReviewDatabase.getListReviewCourse(widget.path);
    setState(() {
      listReview = resultant;
    });
    for (int i = 0; i < listReview.length; i++)
      if (listReview[i]['listUpvote'] == null ||
          listReview[i]['listUpvote']
                  .indexOf(FirebaseAuth.instance.currentUser.uid) ==
              -1)
        stateUpvote.add(false);
      else
        stateUpvote.add(true);
  }

  void udpateData(List newData) {
    setState(() {
      listReview = newData;
    });
  }

  void upVote(int index) {
    setState(() {
      if (!stateUpvote[index]) {
        listReview[index]['upvote'] += 1;
        stateUpvote[index] = true;
      } else if (stateUpvote[index]) {
        listReview[index]['upvote'] -= 1;
        stateUpvote[index] = false;
      }
      // print(listReview[index]['path']);
    });
    courseReviewDatabase.upVote(listReview[index]['path']);
    Map ls;
    if (listReview[index].containsKey('userId'))
          userDatabaseService.changeReputaion(listReview[index]['userId'], stateUpvote[index] ? 1 : -1);
      else print('this review is in old version and can not up vote reputation');

  }

  @override
  Widget build(BuildContext context) {
    if (listReview == null) {
      return Center(
        child: Text('loading'),
      );
    } else
      return Container(
        height: 300,
        child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: listReview.length,
            itemBuilder: (BuildContext context, int index) {
              List<Widget> listStar = [];
              for (int i = 0; i < listReview[index]['star']; i++)
                listStar.add(Container(
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                  width: ScreenUtil().setWidth(12),
                  height: ScreenUtil().setHeight(12),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/yellow_star_icon.png"),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ));
              for (int i = 0; i < 5 - listReview[index]['star']; i++)
                listStar.add(Container(
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                  width: ScreenUtil().setWidth(12),
                  height: ScreenUtil().setHeight(12),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/grey_star_icon.png"),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ));
              listStar
                  .add(Text(timeago.format(listReview[index]['time'].toDate()),
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff303030),
                        fontSize: ScreenUtil().setSp(10),
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      )));
              return Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(24),
                    top: ScreenUtil().setHeight(12)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(bottom: ScreenUtil().setHeight(4)),
                        child: Text(listReview[index]['user'],
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff000000),
                              fontSize: ScreenUtil().setSp(13),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    Row(
                          children: listStar,
                          // [
                          //   Container(
                          //     margin:
                          //         EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                          //     // margin: EdgeInsets.only(
                          //     //     top: ScreenUtil().setHeight(12),
                          //     //     bottom: ScreenUtil().setHeight(14)),
                          //     width: ScreenUtil().setWidth(12),
                          //     height: ScreenUtil().setHeight(12),
                          //     decoration: new BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage(
                          //             "assets/images/yellow_star_icon.png"),
                          //         fit: BoxFit.fill,
                          //         alignment: Alignment.topCenter,
                          //       ),
                          //     ),
                          //   ),
                          //   Container(
                          //     margin:
                          //         EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                          //     // margin: EdgeInsets.only(
                          //     //     top: ScreenUtil().setHeight(12),
                          //     //     bottom: ScreenUtil().setHeight(14)),
                          //     width: ScreenUtil().setWidth(12),
                          //     height: ScreenUtil().setHeight(12),
                          //     decoration: new BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage(
                          //             "assets/images/yellow_star_icon.png"),
                          //         fit: BoxFit.fill,
                          //         alignment: Alignment.topCenter,
                          //       ),
                          //     ),
                          //   ),
                          //   Container(
                          //     margin:
                          //         EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                          //     // margin: EdgeInsets.only(
                          //     //     top: ScreenUtil().setHeight(12),
                          //     //     bottom: ScreenUtil().setHeight(14)),
                          //     width: ScreenUtil().setWidth(12),
                          //     height: ScreenUtil().setHeight(12),
                          //     decoration: new BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage(
                          //             "assets/images/yellow_star_icon.png"),
                          //         fit: BoxFit.fill,
                          //         alignment: Alignment.topCenter,
                          //       ),
                          //     ),
                          //   ),
                          //   Container(
                          //     margin:
                          //         EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                          //     // margin: EdgeInsets.only(
                          //     //     top: ScreenUtil().setHeight(12),
                          //     //     bottom: ScreenUtil().setHeight(14)),
                          //     width: ScreenUtil().setWidth(12),
                          //     height: ScreenUtil().setHeight(12),
                          //     decoration: new BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage(
                          //             "assets/images/yellow_star_icon.png"),
                          //         fit: BoxFit.fill,
                          //         alignment: Alignment.topCenter,
                          //       ),
                          //     ),
                          //   ),
                          //   Container(
                          //     margin:
                          //         EdgeInsets.only(right: ScreenUtil().setWidth(6)),
                          //     // margin: EdgeInsets.only(
                          //     //     top: ScreenUtil().setHeight(12),
                          //     //     bottom: ScreenUtil().setHeight(14)),
                          //     width: ScreenUtil().setWidth(12),
                          //     height: ScreenUtil().setHeight(12),
                          //     decoration: new BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage(
                          //             "assets/images/yellow_star_icon.png"),
                          //         fit: BoxFit.fill,
                          //         alignment: Alignment.topCenter,
                          //       ),
                          //     ),
                          //   ),
                          //   Text(timeago.format(listReview[index]['time'].toDate()),
                          //       style: TextStyle(
                          //         fontFamily: 'SFProDisplay',
                          //         color: Color(0xff303030),
                          //         fontSize: ScreenUtil().setSp(10),
                          //         fontWeight: FontWeight.w300,
                          //         fontStyle: FontStyle.italic,
                          //       )),
                          // ],
                        ),
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(5),
                            bottom: ScreenUtil().setHeight(5)),
                        width: ScreenUtil().setWidth(275),
                        child: Text(listReview[index]['reviewText'],
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff000000),
                              fontSize: ScreenUtil().setSp(12),
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: ScreenUtil().setWidth(12)),
                            child: Text("Find this review helpful?",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff303030),
                                  fontSize: ScreenUtil().setSp(10),
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              upVote(index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(2)),
                              // margin: EdgeInsets.only(
                              //     top: ScreenUtil().setHeight(12),
                              //     bottom: ScreenUtil().setHeight(14)),
                              width: ScreenUtil().setWidth(16),
                              height: ScreenUtil().setHeight(16),
                              decoration: new BoxDecoration(
                                image: DecorationImage(
                                  image: stateUpvote[index] == true? 
                                      AssetImage("assets/images/like_icon.png") : AssetImage("assets/images/unlike_icon.png"),
                                  fit: BoxFit.fill,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                          Text(listReview[index]['upvote'].toString(),
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: stateUpvote[index] ==  true? Color(0xffffbf2f) : Color(0xff303030),
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
                    ]),
              );
            }),
      );
  }
}
