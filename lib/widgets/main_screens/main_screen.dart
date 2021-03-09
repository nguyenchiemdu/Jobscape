import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: selectIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
          BottomNavigationBarItem(
              icon: UnconstrainedBox(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow),
                  // color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/nav_bar_learning_scr.png',
                          width: 20, color: Colors.white),
                      Text(
                        'Learn',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: ''),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.help_center_outlined), label: '')
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
        ],
      ),
    );
  }
}
