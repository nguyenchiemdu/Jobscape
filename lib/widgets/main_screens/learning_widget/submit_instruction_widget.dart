import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/screen_util.dart';

class SubmitInstruction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
              child: Text("How to show the proof of your skill?",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffffbf2f)
                      )
                      ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("If you finish an online course on MOOC platforms like Coursera, Udemy, Datacamp, etc., you can receive a certificate for each of your completed courses. Save your e-certificate from the learning site as a PDF or image file (screenshots are acceptable) then submit in the next tab.",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],
              ),
            ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                          margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                          width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffffbf2f)
                      )
                      ),
                      Container(
                        width: ScreenUtil().setWidth(294),
                        child: new Text("If your learning platforms do not give certificates or you have learned the skill over time yourself, you can find a short Linkedin test for your skill and finish it. Screenshot your test result and submit in the next tab.",
                        style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff454545),
                        fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        )
        ),
                      )
        ],),
                    ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("If you learned the skill at school, please submit a PDF or image file of your Academic Transcript that includes the relevant course name for your skill. The qualified Transcript must have a red seal and the educational institution’s name.",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Text("Why do we need your proof?",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("The system needs to verify that you have successfully learned a new skill and thus, qualified to level up in your learning journey.",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("By submitting the proof of a skill, you help us understand how effective our app is doing and how much you have gained from joining our community of learners.",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("After your proof gets verified, you will be able to unlock the next skills in your learning journey for all skills are arranged in an order from the least challenging to the most challenging.",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Text("Why do we need your proof?",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("Your submitted documents will never be disclosed to a third-party stakeholder. Jobscape only uses these files for the internal process of the learning journey and user’s experience.",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("If you have further questions about this matter, please submit a request in your Profile tab.",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],),
            ),


          ],

        ),
      ),
    );

  }
}