import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:learning_app/models/google_sign_in.dart';
// import 'package:learning_app/widgets/Industry_introduction.dart';
// import 'package:learning_app/widgets/workshop.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
import './learning_widget/learning_widget.dart';
// import 'welcoming.dart';
// import 'Industry_introduction.dart';
// import 'carouse_slider_card.dart';
import './home_widget/home_widget.dart';

class LoggedInWidget extends StatefulWidget {
  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  final user = FirebaseAuth.instance.currentUser;
  
  int selectIndex = 0;
  void _selectPage(int index) {
    if (index != selectIndex) {
      setState(() {
        selectIndex = index;
      });
    }
  }

  List<Widget> listWidget ;
  // void changeRoute(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => MainLearningScreen()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    listWidget = [
    HomeWidget(_selectPage),
    MainLearningScreen(),
  ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: listWidget[selectIndex],
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
        ],
      ),
    );
  }
}
