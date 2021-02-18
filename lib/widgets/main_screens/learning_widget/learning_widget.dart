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
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcoming(),
              IndustryComponent('it',changeScreen),
              IndustryComponent('it',changeScreen),
              IndustryComponent('it',changeScreen),
            ],
          ),
        ),
      ),
    );
    }
  }
}
