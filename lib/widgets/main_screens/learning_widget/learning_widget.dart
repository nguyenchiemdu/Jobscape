import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
  String loadingScreen = 'main';
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
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(46)),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 24),
                        width: ScreenUtil().setWidth(36),
                        height: ScreenUtil().setHeight(36),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  FirebaseAuth.instance.currentUser.photoURL),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 24),
                        child:
                            Text("Today is " + DateFormat.yMMMMd().format(tx),
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff000000),
                                  fontSize: ScreenUtil().setSp(12),
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                )),
                      )
                    ],
                  ),
                  // Welcoming(),
                  Container(
                      margin: EdgeInsets.only(top: 22),
                      child: IndustryComponent('it', changeScreen)),
                  // IndustryComponent('marketing', changeScreen),
                  // IndustryComponent('it', changeScreen),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
