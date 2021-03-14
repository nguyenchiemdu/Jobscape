import 'dart:io';

import 'package:excel/excel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/road_map_database.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/proof_submit_widget.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/road_map_item_widget.dart';
import 'skill_item.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:learning_app/models/industry_database.dart';

class ListSkillWidget extends StatefulWidget {
  final Map roadMapItem;
  final String imgScr;
  ListSkillWidget(this.roadMapItem, this.imgScr);

  @override
  _ListSkillWidgetState createState() => _ListSkillWidgetState();
}

class _ListSkillWidgetState extends State<ListSkillWidget> {
  // final roadMapData;
  // _ListSkillWidgetState(this.roadMapData);
  DatabaseManager industryDatabase = DatabaseManager();
  UserDatabaseService userDatabase =
      UserDatabaseService(uid: FirebaseAuth.instance.currentUser.uid);
  List<Widget> listSkillWidget = [];
  List<Map> listSkill;
  void addData() {
    for (Map skill in widget.roadMapItem['listSkill']) {
      DatabaseManager().addSkill(skill, path: widget.roadMapItem['path']);
    }
  }

  void changeScreen(BuildContext context) {
    List<String> listNameSkill =
        listSkill.map((e) => e['name'].toString()).toList();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubmitProof(listSkill)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    List<Map> res =
        await industryDatabase.getListSkill(widget.roadMapItem['path']);
    List listLearnedSkill =
        await userDatabase.getLearnedSkills(widget.roadMapItem['path']);
    List roadMapImgSrc = await RoadMapDataBase().getListRoadMapReference();
    String skillImgSrc;
    for (Map item in roadMapImgSrc)
      if (item['order'] == widget.roadMapItem['order'])
        skillImgSrc = item['imgSrc'];
    // print('listLearnedSkill :' + listLearnedSkill.toString());
    // print(tmp.toString());
    // print(widget.roadMapItem.toString());
    setState(() {
      listSkill = res;
      listSkillWidget = res
          .map((skill) => SkillItem(skill, widget.imgScr, skillImgSrc))
          .toList();
    });
    // print(listSkillWidget.toList());
  }

  int intConvert(String s) {
    if (double.tryParse(s) != null) {
      return double.parse(s).round();
    } else
      return 999;
  }

  void readExcel() async {
    String sheetName = 'Machine Learning Engineer';
    var file =
        "/Users/dunguyenchiem/Documents/flutter_project/learning_app/LearningRoadmap.xlsx";
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    Map<String, dynamic> skill;
    int condition;
    if (widget.roadMapItem['name'] == 'Must-have') condition = 1;
    if (widget.roadMapItem['name'] == 'Fast Track') condition = 2;
    if (widget.roadMapItem['name'] == 'Advanced') condition = 3;

    for (int i = 1; i < excel.tables[sheetName].rows.length; i++)
      if (intConvert(excel.tables[sheetName].rows[i][1].toString()) ==
          condition) {
        skill = {'name': 'null', 'category': 'null', 'order': 0};
        skill['name'] = excel.tables[sheetName].rows[i][0];
        skill['category'] = excel.tables[sheetName].rows[i][2];
        skill['order'] =
            intConvert(excel.tables[sheetName].rows[i][3].toString());
        // print(
        //     intConvert(excel.tables[sheetName].rows[i][1].toString()).toString());
        print(i.toString());
        print(skill.toString());
        await DatabaseManager()
            .addSkill(skill, path: widget.roadMapItem['path']);
      }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.roadMapItem.toString());
    // readExcel();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: ScreenUtil().setHeight(270),
                width: ScreenUtil().setWidth(360),
                decoration: BoxDecoration(
                    color: Color(0xfffafafa),
                    image: DecorationImage(
                        image: NetworkImage(widget.imgScr), fit: BoxFit.cover)),
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
                                  child: Text(widget.roadMapItem['name'],
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Colors.transparent,
                                        fontSize: ScreenUtil().setSp(26),
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: -0.52,
                                      )),
                                ),
                              ),
                              // Solid text as fill.
                              Text(widget.roadMapItem['name'],
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xffffbf2f),
                                    fontSize: ScreenUtil().setSp(26),
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
                child: GridView.count(
                    padding: EdgeInsets.all(0),
                    crossAxisCount: 2,
                    childAspectRatio: (149 / 222),
                    children: listSkillWidget

                    //     List.generate(widget.roadMapItem['listSkill'].length, (index) {
                    //   return SkillItem(widget.roadMapItem['listSkill'][index]);
                    // }),
                    ),
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
  }
}
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
