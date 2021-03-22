import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:learning_app/models/firebase_storage.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:learning_app/widgets/main_screens/home_widget/avatar_home_widget.dart';
import 'package:learning_app/widgets/main_screens/home_widget/display_name_widget.dart';
import 'package:learning_app/widgets/main_screens/home_widget/progress.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/avatar_leaning_widget.dart';
import './industry_component.dart';
// import './industry_slider_card.dart';
import './road_map_widget.dart';
import 'list_skill_widget.dart';

class MainLearningScreen extends StatefulWidget {
  @override
  _MainLearningScreenState createState() => _MainLearningScreenState();
}

class _MainLearningScreenState extends State<MainLearningScreen> {
  dynamic tx = DateTime.now();
  Map roadMapData;
  Map roadMapItem;
  bool isNewUser = true;
  String loadingScreen = 'main';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    bool res = await UserDatabaseService().getTypeOfUser();
    setState(() {
      isNewUser = res;
    });
  }

  void changeScreen(String screen, dynamic passingData) {
    if (screen == 'roadmap' && passingData != null) {
      roadMapData = passingData;
    }
    if (screen == 'listskill' && passingData != null) {
      roadMapItem = passingData;
    }
    // print('changing to $screen');
    setState(() {
      loadingScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {

    Random random = new Random();
    int randomQuote = random.nextInt(quotes.length);
    // if (loadingScreen == 'roadmap'){
    //     return RoadMapWidget(changeScreen,roadMapData);
    // }
    // if (loadingScreen == 'listskill'){
    //   return ListSkillWidget(changeScreen, roadMapItem);
    // }
    if (loadingScreen == 'main') {
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/top_background.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Container(
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
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     AvatarLearningWidget(),
                //     Container(
                //       margin: EdgeInsets.only(right: 24),
                //       child:
                //           Text("Today is " + DateFormat.yMMMMd().format(tx),
                //               style: TextStyle(
                //                 fontFamily: 'SFProDisplay',
                //                 color: Color(0xff000000),
                //                 fontSize: ScreenUtil().setSp(12),
                //                 fontWeight: FontWeight.w300,
                //                 fontStyle: FontStyle.normal,
                //               )),
                //     )
                //   ],
                // ),
                // Welcoming(),
                Container(
                  // margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                  child: !isNewUser ? Progress() : null,
                ),
                Container(
                    // margin: EdgeInsets.only(top: 22),
                    child: IndustryComponent('it', changeScreen)),
                IndustryComponent('marketing', changeScreen),
                IndustryComponent("finance", changeScreen)
                // IndustryComponent('it', changeScreen),
              ],
            ),
          ),
        ),
      );
    }
  }
}
final quotes = [
  "The best way to get started is to quit talking and begin doing.",
  "Don’t Let Yesterday Take Up Too Much Of Today.",
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
  "What You Lack In Talent Can Be Made Up With Desire, Hustle And Giving 110% All The Time."
      "Wisdom is not a product of schooling but of the lifelong attempt to acquire it.",
  "Develop a passion for learning. If you do, you will never cease to grow.",
  "You don’t understand anything until you learn it more than one way.",
  "Change is the end result of all true learning.",
  "The beautiful thing about learning is nobody can take it away from you."
];