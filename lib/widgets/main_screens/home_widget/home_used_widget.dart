import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:learning_app/widgets/main_screens/home_widget/advisor_widget.dart';
import 'package:learning_app/widgets/main_screens/home_widget/avatar_home_widget.dart';
import 'package:learning_app/widgets/main_screens/home_widget/display_name_widget.dart';
import 'package:learning_app/widgets/main_screens/home_widget/ourteam_widget.dart';
import 'package:learning_app/widgets/main_screens/home_widget/progress.dart';
import './workshop_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import './industry_introduction_widget.dart';
import '../welcoming_widget.dart';
import '../learning_widget/learning_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeUsedWidget extends StatelessWidget {
  final Function selectPage;
  void redirectWorkshop() {
    selectPage(1);
  }

  HomeUsedWidget(this.selectPage);
  dynamic tx = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomQuote = random.nextInt(quotes.length);

    return SingleChildScrollView(
        child: Container(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: ScreenUtil().setHeight(392),
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
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(110)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(21),
                            height: ScreenUtil().setHeight(40),
                          ),
                          AvatarHomeWidget(48),
                          Column(
                            children: [
                              Container(
                                width: ScreenUtil().setWidth(258),
                                margin: EdgeInsets.only(bottom: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
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
                                    Container(
                                      child: Text(
                                        "Today is " +
                                            DateFormat.yMMMMd().format(tx),
                                        style: TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          color: Color(0xff000000),
                                          fontSize: ScreenUtil().setSp(12,
                                              allowFontScalingSelf: true),
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: ScreenUtil().setWidth(258),
                                margin: EdgeInsets.only(bottom: 4),
                                child: Text("\"" + quotes[randomQuote] + "\"",
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xff000000),
                                      fontSize: ScreenUtil().setSp(12,
                                          allowFontScalingSelf: true),
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Progress(),
                  ],
                ),
              ),

              // IndustryIntro(),
              Workshop(redirectWorkshop),
              // SliderCard(),
              // SliderCard(),
              // SliderCard(),
              Advisor(),
              OurTeam(),
            ],
          ),
        ),
      ),
    ));
  }
}
final quotes = ["Plant your garden and decorate your own soul, instead of waiting for someone to bring you flowers.",
  "The best way to get started is to quit talking and begin doing.",
  "Don’t Let Yesterday Take Up Too Much Of Today.",
  "You Learn More From Failure Than From Success. Don’t Let It Stop You. Failure Builds Character.",
  "It’s Not Whether You Get Knocked Down, It’s Whether You Get Up.",
  "The people who are crazy enough to think they can change the world are the ones who do.",
  "Failure Will Never Overtake Me If My Determination To Succeed Is Strong Enough.",
  "We May Encounter Many Defeats But We Must Not Be Defeated.",
  "Knowing Is Not Enough; We Must Apply. Wishing Is Not Enough; We Must Do.",
  "Imagine Your Life Is Perfect In Every Respect; What Would It Look Like?",
  "We Generate Fears While We Sit. We Overcome Them By Action.",
  "Whether You Think You Can Or Think You Can’t, You’re Right.",
  "Security Is Mostly A Superstition. Life Is Either A Daring Adventure Or Nothing.",
  "The Man Who Has Confidence In Himself Gains The Confidence Of Others.",
  "The Only Limit To Our Realization Of Tomorrow Will Be Our Doubts Of Today.",
  "What You Lack In Talent Can Be Made Up With Desire, Hustle And Giving 110% All The Time.",
      "Wisdom is not a product of schooling but of the lifelong attempt to acquire it.",
  "Develop a passion for learning. If you do, you will never cease to grow.",
  "You don’t understand anything until you learn it more than one way.",
  "Change is the end result of all true learning.",
  "The beautiful thing about learning is nobody can take it away from you."
];