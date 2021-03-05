import 'package:flutter/material.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/industry_card.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/skill_item.dart';
import 'course_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:learning_app/models/industry_database.dart';
class ListCourseWidget extends StatefulWidget {
  final Map skillItem;
  ListCourseWidget(this.skillItem);
  final DatabaseManager industryDatabase = DatabaseManager();
  @override
  _ListCourseWidgetState createState() => _ListCourseWidgetState();
}

class _ListCourseWidgetState extends State<ListCourseWidget> {
  List<Widget> listCourseWidget = [];
  void addData(){
    DatabaseManager().addCourse(widget.skillItem['listCourse'][0],path: widget.skillItem['path']);
  }
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      getData();
    }
  void getData()async{
    List listCourse = await widget.industryDatabase.getListCourse(widget.skillItem['path']);
    setState(() {
          listCourseWidget = listCourse.map((course)=> CourseItemWidget(course)).toList();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Stack(
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
                                    child: Text(widget.skillItem['name'],
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
                                Text(widget.skillItem['name'],
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
                  padding: EdgeInsets.only(top:ScreenUtil().setHeight(16),left:ScreenUtil().setWidth(17),right:ScreenUtil().setWidth(17)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    color: Colors.white,
                  ),
                  height: ScreenUtil().setHeight(596),
                  child: ListView(
                    children: listCourseWidget,
                  )
                    // ListView.builder(
                    //   padding: const EdgeInsets.all(8),
                    //   itemCount: widget.skillItem['listCourse'].length,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return CourseItemWidget(widget.skillItem['listCourse'][index]);
                    //   }),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(644),
                        left: ScreenUtil().setWidth(24)),
                    width: ScreenUtil().setWidth(312),
                    height: ScreenUtil().setHeight(50),
                    child: RaisedButton(
                        onPressed: () {},
                        color: Color(0xffffbf2f),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text("Submit Proof",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xffffffff),
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )))),
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //
    //   body: SingleChildScrollView(
    //     child: SafeArea(
    //       child: Container(
    //         child: Column(
    //           children: [
    //             Container(
    //               height: 250,
    //               decoration: BoxDecoration(
    //                   image: DecorationImage(
    //                       image: NetworkImage(
    //                           "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
    //                       fit: BoxFit.cover)),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       RaisedButton(
    //                         onPressed: () {
    //                           Navigator.pop(context);
    //                         },
    //                         child: Icon(Icons.arrow_back),
    //                       ),
    //                       RaisedButton(
    //                         onPressed: () {},
    //                         child: Icon(
    //                           Icons.favorite,
    //                           color: Colors.pink,
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                   Text(
    //                     skillItem['name'],
    //                     style: TextStyle(
    //                         fontSize: 30,
    //                         color: Colors.red,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               height: 300,
    //               child: ListView.builder(
    //                   padding: const EdgeInsets.all(8),
    //                   itemCount: skillItem['listCourse'].length,
    //                   itemBuilder: (BuildContext context, int index) {
    //                     return CourseItemWidget(skillItem['listCourse'][index]);
    //                   }),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
