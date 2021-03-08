import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/main.dart';
import 'login_screen.dart';
import 'package:learning_app/models/users_database.dart';

class ConfirmEmail extends StatefulWidget {
  String user_gmail;
  ConfirmEmail(this.user_gmail);
  @override
  _ConfirmEmailState createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundlogin.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 320, bottom: 9, left: 50),
            child: Text("Verification",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff303030),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16, left: 50),
            width: 312,
            child: RichText(
                text: new TextSpan(children: [
              new TextSpan(
                  text: "We’ve sent an email to ",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff303030),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              new TextSpan(
                  text: widget.user_gmail,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xffffbf2f),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ])),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 208, left: 50, right: 50),
            child: Text(
                "Please click on the link to verify your email address. If you don’t see it, please kindly check your spam folder.",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff303030),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Container(
              width: 312,
              height: 48,
              margin: EdgeInsets.only(left: 50, right: 50),
              child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xffffbf2f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Resend email",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )))),
        ],
      ),
    ));
  }

  Future<void> checkEmailVerified() async {
    final enrolled_course = await UserDatabaseService()
        .getUserEnrolledCourse(FirebaseAuth.instance.currentUser.uid);
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => RoutePage(enrolled_course)));
    }
  }
}
