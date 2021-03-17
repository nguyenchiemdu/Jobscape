import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncognitoModeWidget extends StatefulWidget {
  final bool status;
  IncognitoModeWidget(this.status);
  @override
  _IncognitoModeWidgetState createState() =>
      _IncognitoModeWidgetState(this.status);
}

class _IncognitoModeWidgetState extends State<IncognitoModeWidget> {
  bool status;
  _IncognitoModeWidgetState(this.status);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: ScreenUtil().setWidth(225),height: ScreenUtil().setHeight(42),),
        InkWell(
          onTap: () {
            setState(() {
              status = !status;
            });
            print(status);
          },
          child: Container(
              width: ScreenUtil().setWidth(87),
              height: ScreenUtil().setHeight(25),
              decoration: new BoxDecoration(
                  color: status ? Color(0xffffbf2f) : Color(0xffffefcc),
                  borderRadius: BorderRadius.circular(8)
              ),
            child:
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        right: ScreenUtil().setWidth(6)),
                    width: ScreenUtil().setWidth(20),
                    height: ScreenUtil().setHeight(20),
                    child: Image.asset(
                        "assets/images/incognito_icon.png")),
                Text("Incognito",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff454545),
                      fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: false),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )
                )
              ],

            ),
          ),
        )
      ],
    );

    //   Switch(
    //   value: status,
    //   onChanged: (value) {
    //     setState(() {
    //       status = !status;
    //     });
    //   },
    //   activeTrackColor: Colors.lightGreenAccent,
    //   activeColor: Colors.green,
    // );
  }
}
