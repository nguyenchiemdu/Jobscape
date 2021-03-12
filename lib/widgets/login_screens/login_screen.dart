import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:learning_app/widgets/login_screens/warning.dart';
import './register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final user = TextEditingController();
  final password = TextEditingController();
  void changeRoute(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterForm()),
    );
  }

  void signIn(BuildContext context, user, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              // email: user.text,
              // password: password.text
              email: user,
              password: password);
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text('Signed in!'),
      // ));
    } on FirebaseAuthException catch (e) {
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text(e.code),
      // ));
      print(e.code);
    }
  }

  void signInGoogle(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/backgroundlogin.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Container(
                  // padding: EdgeInsets.only(left: 24),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(276)),
                  width: double.infinity,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 24),
                    child: Text("Hello, nice to meet you!",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff303030),
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24, top: 3, bottom: 22),
                    child: Text("Sign in",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff303030),
                          fontSize: ScreenUtil().setSp(24),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Container(
                      margin:
                          EdgeInsets.only(left: 24, right: 24, bottom: 15),
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(53),
                      padding: EdgeInsets.only(left: 20),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x26454545),
                              offset: Offset(0, 5),
                              blurRadius: 15,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          controller: user,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_rounded,
                              color: Color(0xff303030),
                            ),
                            hintText: 'Email',
                            contentPadding: EdgeInsets.only(
                                left: 14, top: 18, bottom: 18),
                            hintStyle: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff303030),
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ))),
                  Container(
                      margin:
                          EdgeInsets.only(left: 24, right: 24, bottom: 15),
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(53),
                      padding: EdgeInsets.only(left: 20),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x26454545),
                              offset: Offset(0, 5),
                              blurRadius: 15,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          obscureText: true,
                          controller: password,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xff303030),
                            ),
                            hintText: 'Password',
                            contentPadding: EdgeInsets.only(
                                left: 14, top: 18, bottom: 18),
                            hintStyle: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff303030),
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ))),
                  Container(
                    margin:
                        EdgeInsets.only(bottom: ScreenUtil().setHeight(18)),
                    alignment: Alignment.center,
                    child: Text("Forgot you password?",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff000000),
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  Container(
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(48),
                      margin: EdgeInsets.only(left: 24, right: 24),
                      child: RaisedButton(
                          onPressed: () {
                            signIn(context, user.text, password.text);
                          },
                          color: Color(0xffffbf2f),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text("Login",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xffffffff),
                                fontSize: ScreenUtil().setSp(20),
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )))),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(21),
                        bottom: ScreenUtil().setHeight(13),
                      ),
                      // margin: EdgeInsets.only(
                      //     top: 21, left: 136, right: 136, bottom: 13),
                      child: Text("or continue with",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w100,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(context: context,
                                builder: (BuildContext context) {
                                  return AdvanceCustomAlert("Sorry for this inconvenience","We don't support facebook account at this moment.Please sign up or use your Google Account to explore Jobscape now.");
                                });
                          },
                          child: Container(
                            width: ScreenUtil().setWidth(79),
                            height: ScreenUtil().setHeight(49),
                            margin: EdgeInsets.only(right: 10),
                            decoration: new BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x0f000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: FractionallySizedBox(
                                widthFactor: 0.5,
                                heightFactor: 0.5,
                                child: Image.asset(
                                  "assets/images/loginfacebook.png",
                                  width: 12,
                                  height: 23,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            signInGoogle(context);
                          },
                          child: Container(
                            width: ScreenUtil().setWidth(79),
                            height: ScreenUtil().setHeight(49),
                            margin: EdgeInsets.only(left: 10),
                            decoration: new BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x0f000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: FractionallySizedBox(
                                widthFactor: 0.5,
                                heightFactor: 0.5,
                                child: Image.asset(
                                  "assets/images/logingoogle.png",
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: RichText(
                        text: new TextSpan(children: [
                      new TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w100,
                            fontStyle: FontStyle.normal,
                          )),
                      new TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              changeRoute(context);
                            }),
                    ])),
                  )
                ],
                  ),
                )),
              Positioned(
                left: ScreenUtil().setWidth(120),
                top: ScreenUtil().setHeight(75),
                child: Container(
                  width: ScreenUtil().setWidth(116),
                  height: ScreenUtil().setHeight(130),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image:
                      AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
showAlertDialog(BuildContext context, String journey, Function startJourney) {
  Widget cancelButton = FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text("Cancel"));
  // set up the button
  Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
        startJourney();
      });

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Sorry, we don't support facebook account at this moment.",
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          color: Color(0xff000000),
          fontSize: ScreenUtil().setSp(20),
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        )),
    content: Text(
        "Please sign up with us or use your Google Account to sign in to explore Jobscape now.",
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          color: Color(0xff000000),
          fontSize: ScreenUtil().setSp(14),
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
        )),
    actions: [
      cancelButton,
      okButton,
    ],
  );
// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
