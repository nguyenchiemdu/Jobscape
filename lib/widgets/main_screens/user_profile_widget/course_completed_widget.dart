import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/learning_widget.dart';

class CourseCompleted extends StatefulWidget {

  final Function selectPage;
  CourseCompleted(this.selectPage);
  @override
  _CourseCompletedState createState() => _CourseCompletedState();
}

class _CourseCompletedState extends State<CourseCompleted> {
  List learnedSkills = [];
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      getData();
  }
  getData() async {
    List res =  await UserDatabaseService().getAllLearnedSkills();
    setState(() {
          learnedSkills = res;
        });
    print(res.length);
  }
  String imageFind(category) {
    switch (category) {
      case 'optional':
        return "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/SkillImg%2Foptional.jpg?alt=media&token=b53646cb-a130-4dcb-b8b4-82b14eb83d84";
        break;
      case 'must-learn':
        return "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/SkillImg%2Fmust%20learn.jpg?alt=media&token=ddaf7458-76fe-491f-8cff-f03a1a5c4d26";
        break;
      case 'programming language':
        return "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/SkillImg%2Fprogramming_language.jpg?alt=media&token=a404cfee-7903-4fea-a16e-bcc36a2c1e84";
        break;
      case 'tool':
        return "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/SkillImg%2Ftool.jpg?alt=media&token=ebc7a43b-db08-4cd0-bcab-ca9316c0fffe";
        break;
      case 'library':
        return "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/SkillImg%2Flibrary.jpg?alt=media&token=da30180e-1802-44a3-9425-45c8a01ef420";
        break;
      case 'framework':
        return "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/SkillImg%2Fframework.png?alt=media&token=86c18489-7e34-4e3a-bae3-c999a132f545";
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(28)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(14),left: ScreenUtil().setWidth(24)),
            child: Text("Your courses completed",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff000000),
                  fontSize: ScreenUtil().setSp(15,allowFontScalingSelf: false),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                )
            ),
          ),
          if (learnedSkills.length!=0)
            Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
                  width: ScreenUtil().setWidth(162),
                  height: ScreenUtil().setHeight(107),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                    color: Color(0xffffd3a3),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
                  width: ScreenUtil().setWidth(324),
                  height: ScreenUtil().setHeight(130),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: learnedSkills.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(right:ScreenUtil().setWidth(18)),
                        width: ScreenUtil().setWidth(130),
                        height: ScreenUtil().setHeight(130),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image:
                            CachedNetworkImageProvider(imageFind(learnedSkills[index]['cate'])),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child:
                        Column(
                          children: [
                            SizedBox(
                              width: ScreenUtil().setWidth(20),
                              height: ScreenUtil().setHeight(15),
                            ),
                            Center(
                              child: Text(learnedSkills[index]['skillName'],
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xffffbf2f),
                                    fontSize: ScreenUtil().setSp(22,allowFontScalingSelf: false),
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  )
                              ),
                            ),
                          ],
                        )
                      );
                    },
                  )
                ),
            ],
          ),
          if (learnedSkills.length==0)
            Center(
              child: Container(
                width: ScreenUtil().setWidth(312),
                child: RichText(
                    text: new TextSpan(
                        children: [
                          new TextSpan(
                              text: "You have not completed any courses.",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff303030),
                                fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: false),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,


                              )
                          ),
                          new TextSpan(
                              text: " Go back and learn now!",
                              recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                widget.selectPage(2);
                              },
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xffffbf2f),
                                fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: false),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )
                          ),
                        ]
                    )
                ),
              ),
            )


        ],
      ),
    );
  }
}