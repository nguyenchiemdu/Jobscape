import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'confirm_email.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';
import 'package:learning_app/models/users_database.dart';
class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  
  void signInGoogle(BuildContext context) async{
    
    final provider =  Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.signInWithGoogle().then((value) => Navigator.pop(context));
   
  }
  final username = TextEditingController();

  final password = TextEditingController();

  final repeat_password = TextEditingController();

  bool _value = false;

  void createUser() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username.text,
          password: password.text
      ).then((_) {
        if ((username.text != null)  &  (_value) & (password.text == repeat_password.text)){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConfirmEmail(username.text)),
          );
        }
      });
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User user = auth.currentUser;
      final uid = user.uid;
      //Create a new documnet for the user with the uid
      await UserDatabaseService(uid:uid).updateUserData("New user", 0, 0, 0);
  } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }


  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: SingleChildScrollView(
        child: Container(

          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage("assets/images/backgroundlogin.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
              child: Column(
                  children : [
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.end ,
                    //     children: [
                    //       Text('English'),
                    //       Icon(Icons.arrow_drop_down)
                    //     ]
                    // ),
                    Container(
                      // padding: EdgeInsets.only(left: 20, right: 20),
                      margin: EdgeInsets.only(top : ScreenUtil().setHeight(284),),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(312),
                            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(2),),
                            child: Text("Hello, nice to meet you!",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff303030),
                                  fontSize: ScreenUtil().setSp(14),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,


                                )
                            ),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(312),
                            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(17),),
                            child: Text("Sign up",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff303030),
                                  fontSize: ScreenUtil().setSp(24),
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal,


                                )
                            ),
                          ),

                          Container(
                              margin: EdgeInsets.only(bottom:ScreenUtil().setHeight(15),),
                              width: ScreenUtil().setWidth(312),
                              height: ScreenUtil().setHeight(53),
                              padding: EdgeInsets.only(left:ScreenUtil().setWidth(20),),
                              decoration: new BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color(0x26454545),
                                    offset: Offset(0,5),
                                    blurRadius: 15,
                                    spreadRadius: 0
                                ) ],
                              ),
                              child: TextField(
                                  controller:  username,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.email_rounded,
                                      color: Color(0xff303030),
                                    ),
                                    hintText: 'Email',
                                    contentPadding: EdgeInsets.only(left: 14,top:18,bottom: 18),
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
                                  )
                              )
                          ),
                          Container(
                              width: ScreenUtil().setWidth(312),
                              height: ScreenUtil().setHeight(53),
                              margin: EdgeInsets.only(bottom:ScreenUtil().setHeight(15),),
                              padding: EdgeInsets.only(left:ScreenUtil().setWidth(20),),
                              decoration: new BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color(0x26454545),
                                    offset: Offset(0,5),
                                    blurRadius: 15,
                                    spreadRadius: 0
                                ) ],
                              ),
                              child: TextField(
                                  obscureText: true,
                                  controller:  password,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Color(0xff303030),
                                    ),
                                    hintText: 'Password',
                                    contentPadding: EdgeInsets.only(left: 14,top:18,bottom: 18),
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
                                  )
                              )
                          ),
                          Container(
                              width: ScreenUtil().setWidth(312),
                              height: ScreenUtil().setHeight(53),
                              margin: EdgeInsets.only(bottom:ScreenUtil().setHeight(15),),
                              padding: EdgeInsets.only(left:ScreenUtil().setWidth(20),),
                              decoration: new BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color(0x26454545),
                                    offset: Offset(0,5),
                                    blurRadius: 15,
                                    spreadRadius: 0
                                ) ],
                              ),
                              child: TextField(
                                  obscureText: true,
                                  controller:  repeat_password,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Color(0xff303030),
                                    ),
                                    hintText: 'Repeat Password',
                                    contentPadding: EdgeInsets.only(left: 14,top:18,bottom: 18),
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
                                  )
                              )
                          ),
                          Center(
                            child: Container(
                              width: ScreenUtil().setWidth(312),
                              margin: EdgeInsets.only(bottom:ScreenUtil().setHeight(18),),
                              child: Row(
                                children: [
                                  Container(
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _value = !_value;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right:10 ),
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(color: Color(0xffffbf2f),
                                              borderRadius: BorderRadius.circular(4)),

                                          child: _value
                                              ? Icon(
                                            Icons.check,
                                            size: 15,
                                            color: Colors.white,
                                          )
                                              : Icon(
                                            Icons.check_box_outline_blank,
                                            size: 15,
                                            color: Color(0xffffbf2f),

                                          ),
                                        )
                                    ),
                                  ),
                                  RichText(
                                      text: new TextSpan(
                                          children: [

                                            new TextSpan(
                                                text: "Agreed with ",
                                                style: TextStyle(
                                                  fontFamily: 'SFProDisplay',
                                                  color: Color(0xff303030),
                                                  fontSize: ScreenUtil().setSp(14),
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,


                                                )
                                            ),
                                            new TextSpan(
                                                text: "Term & Conditions",
                                                style: TextStyle(
                                                  fontFamily: 'SFProDisplay',
                                                  color: Color(0xffffbf2f),
                                                  fontSize: ScreenUtil().setSp(14),
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  decoration: TextDecoration.underline,


                                                )
                                            ),
                                          ]
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Text('Password'),
                          // TextField(controller: password,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right:ScreenUtil().setWidth(12)),
                                  width: ScreenUtil().setWidth(150),
                                  height: ScreenUtil().setHeight(50),
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      onPressed: (){Navigator.pop(context);},
                                      color: Color(0xffffffff),
                                      child: Text("Back",
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            color: Color(0xffffbf2f),
                                            fontSize: ScreenUtil().setSp(18),
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )
                                      ))),
                              Container(
                                  width: ScreenUtil().setWidth(150),
                                  height: ScreenUtil().setHeight(50),
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      onPressed: createUser,
                                      //createUser
                                      color: Color(0xffffbf2f),
                                      child: Text("Next",
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            color: Color(0xffffffff),
                                            fontSize: ScreenUtil().setSp(18),
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )
                                      ))),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 22, bottom: 14),
                            child: Text("or continue with",
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff000000),
                                  fontSize: ScreenUtil().setSp(14),
                                  fontWeight: FontWeight.w100,
                                  fontStyle: FontStyle.normal,
                                )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom:12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 79,
                                    height: 49,
                                    margin: EdgeInsets.only(right:10),
                                    decoration: new BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [BoxShadow(
                                          color: Color(0x0f000000),
                                          offset: Offset(0,0),
                                          blurRadius: 10,
                                          spreadRadius: 0
                                      ) ],
                                    ),
                                    child: FractionallySizedBox(
                                        widthFactor: 0.5,
                                        heightFactor: 0.5,
                                        child: Image.asset("assets/images/loginfacebook.png",
                                          width: 12,
                                          height: 23,
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){this.signInGoogle(context);},
                                  child: Container(
                                    width: 79,
                                    height: 49,
                                    margin: EdgeInsets.only(left:10),
                                    decoration: new BoxDecoration(

                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [BoxShadow(
                                          color: Color(0x0f000000),
                                          offset: Offset(0,0),
                                          blurRadius: 10,
                                          spreadRadius: 0
                                      ) ],
                                    ),
                                    child: FractionallySizedBox(
                                        widthFactor: 0.5,
                                        heightFactor: 0.5,
                                        child: Image.asset("assets/images/logingoogle.png",
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                  ]
              )
          ),
        ),
      ),
    );
  }
}