import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/submit_instruction_widget.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/submit_widget.dart';

class SubmitProof extends StatelessWidget {
  List<Map> listSkill;
  SubmitProof(this.listSkill);
  @override
  Widget build(BuildContext context) {
    // print(listNameSkill.toString());
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
                  child: Column(
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
                                    child: Text("Submit Proof",
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
                                Text("Submit Proof",
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
                    height: ScreenUtil().setHeight(596),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 1,
                      child: Column(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(312),
                            height: ScreenUtil().setHeight(34),
                            decoration: new BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x1a454545),
                                    offset: Offset(0, 5),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: TabBar(
                              indicator: BoxDecoration(
                                color: Color(0xffffbf2f),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tabs: [
                                Text("Instruction",
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(16),
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    )),
                                Text("Submit",
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(16),
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            height: 528,
                            child: TabBarView(
                              children: [
                                SubmitInstruction(),
                                Submit(listSkill)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    // ListView.builder(
                    //   padding: const EdgeInsets.all(8),
                    //   itemCount: widget.skillItem['listCourse'].length,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return CourseItemWidget(widget.skillItem['listCourse'][index]);
                    //   }),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
