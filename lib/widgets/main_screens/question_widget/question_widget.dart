import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:intl/intl.dart';
import 'package:learning_app/widgets/main_screens/home_widget/avatar_home_widget.dart';
import 'package:learning_app/widgets/main_screens/home_widget/display_name_widget.dart';
import 'enter_question_form.dart';

class QuestionWidget extends StatelessWidget {
  dynamic tx = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(330),
            width: ScreenUtil().setWidth(360),
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/top_background.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              color: Color(0xfffffdfa),
              boxShadow: [
                BoxShadow(
                    color: Color(0x19454545),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 0)
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(106)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AvatarHomeWidget(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(258),
                            margin: EdgeInsets.only(bottom: 4),
                            child: Container(
                                child: DisplayName(
                                  title: 'Hello ',
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff000000),
                                    fontSize: ScreenUtil().setSp(14,
                                        allowFontScalingSelf: true),
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )),
                          ),
                          Container(
                            child: Text(
                              "Today is " +
                                  DateFormat.yMMMMEEEEd().format(tx),
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: ScreenUtil().setSp(12,
                                    allowFontScalingSelf: false),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                AddQuestionWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
