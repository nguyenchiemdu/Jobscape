import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvanceCustomAlert extends StatelessWidget {
  String title;
  String message;
  AdvanceCustomAlert(this.title,this.message);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              // constraints: BoxConstraints(
              //   maxHeight: double.infinity,
              // ),
              height: ScreenUtil().setHeight(270),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 70, 10, 10),
                child: Column(
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(20,allowFontScalingSelf: false)),),
                    SizedBox(height: 15,),
                    Text(message, style: TextStyle(fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false)),),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      child: RaisedButton(onPressed: () {
                        Navigator.of(context).pop();
                      },
                        color: Color(0xffffbf2f),
                        child: Text('OK', style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Color(0xffffbf2f),
                  radius: 50,
                  child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}

class AdvanceCustomAlert2 extends StatelessWidget {
  String title;
  String message;
  Function doFunction;
  AdvanceCustomAlert2(this.title,this.message,this.doFunction);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              // constraints: BoxConstraints(
              //   maxHeight: double.infinity,
              // ),
              height: ScreenUtil().setHeight(255),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 70, 10, 10),
                child: Column(
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(20,allowFontScalingSelf: false)),),
                    SizedBox(height: 15,),
                    Text(message, style: TextStyle(fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false)),),
                    SizedBox(height: 20,),
                    Container(
                      width: ScreenUtil().setWidth(170),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                            child: RaisedButton(onPressed: () {
                              Navigator.of(context).pop();
                            },
                              color: Color(0xffffbf2f),
                              child: Text('Cancel', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                            child: RaisedButton(onPressed: () {
                              Navigator.of(context).pop();
                              doFunction();
                            },
                              color: Color(0xffffbf2f),
                              child: Text('OK', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -40,
                child: CircleAvatar(
                  backgroundColor: Color(0xffffbf2f),
                  radius: 50,
                  child: Icon(Icons.notifications, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}

class Membership extends StatelessWidget {
  String member;
  String message;
  int number;
  Membership(this.member,this.message,this.number);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              // constraints: BoxConstraints(
              //   maxHeight: double.infinity,
              // ),
              height: ScreenUtil().setHeight(270),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 70, 10, 10),
                child: Column(
                  children: [
                    Text(member, style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25,allowFontScalingSelf: false)),),
                    SizedBox(height: 15,),
                    Text(message, style: TextStyle(fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false)),),
                    SizedBox(height: 20,),
                    Center(
                      child: Stack(children: [
                        Container(
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setHeight(6),
                            decoration: new BoxDecoration(
                                color: Color(0xffeaeaea),
                                borderRadius: BorderRadius.circular(6))),
                        Container(
                            width: ScreenUtil().setWidth(100 * number / 100),
                            height: ScreenUtil().setHeight(6),
                            decoration: new BoxDecoration(
                                color: Color(0xffffbf2f),
                                borderRadius: BorderRadius.circular(6))),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      child: RaisedButton(onPressed: () {
                        Navigator.of(context).pop();
                      },
                        color: Color(0xffffbf2f),
                        child: Text('OK', style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: Color(0xffffbf2f),
                  radius: 50,
                  child: Icon(Icons.assistant_photo, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}