import 'package:flutter/material.dart';
import './industry_component.dart';
// import './industry_slider_card.dart';
import './road_map_widget.dart';
import 'list_skill_widget.dart';
class MainLearningScreen extends StatefulWidget {
  @override
  _MainLearningScreenState createState() => _MainLearningScreenState();
}

class _MainLearningScreenState extends State<MainLearningScreen> {
  Map roadMapData;
  Map roadMapItem;
  String loadingScreen = 'main';
  void changeScreen(String screen, dynamic passingData){
    if (screen == 'roadmap' && passingData !=null){
      roadMapData = passingData;
    }
    if (screen == 'listskill' && passingData !=null){
      roadMapItem = passingData;
    }
    // print('changing to $screen');
    setState(() {
      loadingScreen = screen;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (loadingScreen == 'roadmap'){
        return RoadMapWidget(changeScreen,roadMapData);
    }
    if (loadingScreen == 'listskill'){
      return ListSkillWidget(changeScreen, roadMapItem);
    }
    if (loadingScreen== 'main'){
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
              margin: EdgeInsets.only(top: 88),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        margin:EdgeInsets.only(left:24),
                        width: 36,
                        height: 36,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://bizweb.dktcdn.net/100/175/849/files/chup-anh-profile-doanh-nhan-chan-dung-nghe-nghiep-dep-o-ha-noi-12.jpg?v=1556771914677#.YCeLPA8sis8.link'),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 24),
                        child: Text("Today is Monday, 15 Feb, 2021 ",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,


                            )
                        ),
                      )
                    ],
                  ),
                  // Welcoming(),
                  Container(
                    margin: EdgeInsets.only(top: 22),
                      child: IndustryComponent('it',changeScreen)),
                  IndustryComponent('it',changeScreen),
                  IndustryComponent('it',changeScreen),
                ],
              ),
            ),
          ),
        ),
    );
    }
  }
}
