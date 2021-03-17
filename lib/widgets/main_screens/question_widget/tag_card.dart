import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterCard extends StatefulWidget {
  String name;
  FilterCard(this.name);
  @override
  _FilterCardState createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  bool chosen = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          chosen = !chosen;
        });
        if (chosen)
          print(widget.name.toString());
      },
      child: Container(
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(8)),
        width: ScreenUtil().setWidth(130),
        height: ScreenUtil().setHeight(20),
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: chosen ? Color(0xffffbf2f) :Color(0xffffefcc),),
        child: FittedBox(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(2),horizontal: ScreenUtil().setWidth(11)),
            child: Text(widget.name,
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff888888),
                  fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                )),
          ),
        ),
      ),
    );
  }
}