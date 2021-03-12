import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/users_database.dart';

class UserInforWidget extends StatefulWidget {
  @override
  _UserInforWidgetState createState() => _UserInforWidgetState();
}

class _UserInforWidgetState extends State<UserInforWidget> {
  Map<String, dynamic> user = {};
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Map<String, dynamic> res = await UserDatabaseService().getUserInfor();
    setState(() {
      user = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(6), left: ScreenUtil().setWidth(24)),
      child: Row(
        children: [
          Text(user['age'] == null ? "Age" : user['age'] + ' years old',
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                color: Color(0xff000000),
                fontSize: ScreenUtil().setSp(15, allowFontScalingSelf: false),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          Text(
              user['currentPosition'] == null || user['currentPosition'] == ''
                  ? " - Occupation"
                  : ' - ' + user['currentPosition'],
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                color: Color(0xff000000),
                fontSize: ScreenUtil().setSp(15, allowFontScalingSelf: false),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          Text(
              user['yearExperience'] == null || user['yearExperience'] == ''
                  ? " - Years of Experience"
                  : ' - ' + user['yearExperience'],
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                color: Color(0xff000000),
                fontSize: ScreenUtil().setSp(15, allowFontScalingSelf: false),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ],
      ),
    );
  }
}
