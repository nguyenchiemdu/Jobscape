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
              height: ScreenUtil().setHeight(250),
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