import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:learning_app/widgets/main_screens/home_widget/home_used_widget.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/user_profile_widget.dart';
import './learning_widget/learning_widget.dart';
import './home_widget/home_widget.dart';
import 'package:learning_app/models/users_database.dart';
import './question_widget/question_widget.dart';
import './workshop_widget/workshop_widget_main.dart';

class LoggedInWidget extends StatefulWidget {
  final int sub;
  LoggedInWidget(this.sub);
  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState(sub);
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  final user = FirebaseAuth.instance.currentUser;
  int selectIndex = 0;
  int sub;
  int enrolled_course;

  // Future<int> getEnrolledCourse() async {
  //   int enrolled_course = await UserDatabaseService().getUserEnrolledCourse(FirebaseAuth.instance.currentUser.uid);
  //   return enrolled_course;
  // }

  _LoggedInWidgetState(this.sub);
  void _selectPage(int index) async {
    final enrolled_course = await UserDatabaseService()
        .getUserEnrolledCourse(FirebaseAuth.instance.currentUser.uid);
    if (index != selectIndex) {
      if (enrolled_course == 0) {
        setState(() {
          selectIndex = index;
          sub = 0;
        });
      } else {
        setState(() {
          selectIndex = index;
          sub = 1;
        });
      }
    }
  }

  var listWidget;
  // void changeRoute(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => MainLearningScreen()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    listWidget = [
      [HomeWidget(_selectPage), HomeUsedWidget(_selectPage)],
      MainLearningScreen(),
      WorkshopWidget(),
      // QuestionWidget(),
      UserProfileWidget()
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: selectIndex == 0
          ? listWidget[selectIndex][sub]
          : listWidget[selectIndex],
      bottomNavigationBar: Container(
        width: ScreenUtil().setWidth(360),
        height: ScreenUtil().setHeight(59),
        decoration: new BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [BoxShadow(
              color: Color(0x26454545),
              offset: Offset(0,-2),
              blurRadius: 5,
              spreadRadius: 0
          )],
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),)
        ),
        child: BottomNavigationBar(
          onTap: _selectPage,
          // backgroundColor: Theme.of(context).primaryColor,
          currentIndex: selectIndex,
          items: [
            BottomNavigationBarItem(icon: Container(
              width: ScreenUtil().setWidth(24),
              height: ScreenUtil().setHeight(24),
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: selectIndex == 0? AssetImage("assets/images/chosen_homepage_icon.png") :
                  AssetImage("assets/images/homepage_icon.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ), label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: ScreenUtil().setWidth(24),
                  height: ScreenUtil().setHeight(24),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: selectIndex == 1? AssetImage("assets/images/chosen_learning_icon.png") :
                      AssetImage("assets/images/learning_icon.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(icon: Container(
              width: ScreenUtil().setWidth(24),
              height: ScreenUtil().setHeight(24),
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: selectIndex == 2?
                  AssetImage("assets/images/choosen_workshop_icon.png") : AssetImage("assets/images/workshop_icon.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ), label: ''),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.help_center_outlined), label: '')
            BottomNavigationBarItem(icon: Container(
              width: ScreenUtil().setWidth(24),
              height: ScreenUtil().setHeight(24),
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: selectIndex == 3? AssetImage("assets/images/chosen_userprofile_icon.png"):
                  AssetImage("assets/images/userprofile_icon.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ), label: "")
          ],
        ),
      ),
    );
  }
}
