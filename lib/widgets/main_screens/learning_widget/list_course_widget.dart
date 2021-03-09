import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/industry_card.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/skill_item.dart';
import 'course_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:learning_app/models/industry_database.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'proof_submit_widget.dart';

class ListCourseWidget extends StatefulWidget {
  final Map skillItem;
  ListCourseWidget(this.skillItem);
  final DatabaseManager industryDatabase = DatabaseManager();
  @override
  _ListCourseWidgetState createState() => _ListCourseWidgetState();
}

class _ListCourseWidgetState extends State<ListCourseWidget> {
  List<Widget> listCourseWidget = [];
  List listCourse;
  void addData(String path) async {
    List res = await DatabaseManager().getListCourse(path);
    int length;
    if (res == null)
      length = 0;
    else
      length = res.length;
    if (length == 0)
      readExcel(widget.skillItem['name'].toString());
    else
      print('data base alredy has data');
  }

  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SubmitProof([widget.skillItem['name'].toString()])),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // Dòng dưới này là để add data từ file excel, nếu k add thì comment lại
    // addData(widget.skillItem['path']);
  }

  void readExcel(String sheetName) async {
    var file =
        "/Users/dunguyenchiem/Documents/flutter/learing_app/Onlinecourses.xlsx";
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    Map<String, dynamic> course;
    // for (var table in excel.tables.keys) {
    //   print(table); //sheet Name
    //   print(excel.tables[table].maxCols);
    //   print(excel.tables[table].maxRows);
    // for (var row in excel.tables[sheetName].rows) {
    //   print("$row");
    // }
    // }
    for (int i = 1; i < excel.tables[sheetName].rows.length; i++) {
      course = {
        "3": 0,
        "review": 0,
        "4": 0,
        "price": 0,
        "link":
            "https://edumall.vn/courses/hoc-htmlcss-co-ban-qua-bai-tap-thuc-te",
        "1": 0,
        "5": 0,
        "2": 0,
        "name": "Null",
      };
      course['name'] = excel.tables[sheetName].rows[i][1];
      course['provider'] = excel.tables[sheetName].rows[i][2];
      course['review'] =
          double.tryParse(excel.tables[sheetName].rows[i][3].toString());
      if (course['review'] == null) course['review'] == 0;
      course['level'] =
          excel.tables[sheetName].rows[i][4].toString()[0].toUpperCase() +
              excel.tables[sheetName].rows[i][4].toString().substring(1);
      course['price'] =
          double.tryParse(excel.tables[sheetName].rows[i][5].toString());
      if (course['price'] == null) course['price'] = 0;
      if (excel.tables[sheetName].rows[i][5].toString() == 'subcription' ||
          excel.tables[sheetName].rows[i][5].toString() == 'Subcription')
        course['price'] = 'Subcription';
      course['link'] = excel.tables[sheetName].rows[i][6];
      print(course.toString());
      await DatabaseManager().addCourse(course, path: widget.skillItem['path']);
    }
  }

  void getData() async {
    listCourse =
        await widget.industryDatabase.getListCourse(widget.skillItem['path']);
    setState(() {
      listCourseWidget =
          listCourse.map((course) => CourseItemWidget(course)).toList();
    });
    // print(jsonEncode(listCourse));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                child: Column(
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
                                child: BorderedText(
                                  strokeWidth: 1,
                                  strokeColor: Color(0xffffbf2f),
                                  child: Text(widget.skillItem['name'],
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Colors.transparent,
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
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(164)),
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(16),
                      left: ScreenUtil().setWidth(17),
                      right: ScreenUtil().setWidth(17)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    color: Colors.white,
                  ),
                  height: ScreenUtil().setHeight(515),
                  child: ListView(
                    padding: EdgeInsets.all(0),
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
                      top: ScreenUtil().setHeight(686),
                      left: ScreenUtil().setWidth(24)),
                  width: ScreenUtil().setWidth(312),
                  height: ScreenUtil().setHeight(50),
                  child: RaisedButton(
                      onPressed: () {
                        changeScreen(context);
                      },
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
