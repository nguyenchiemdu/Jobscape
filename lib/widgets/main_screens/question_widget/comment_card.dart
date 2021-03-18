import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class CommentCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(260),
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(12),
            width: ScreenUtil().setWidth(100),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setWidth(40),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider("https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/avatar%2Favatar.png?alt=media&token=a72c897f-1ce3-4e1d-ba00-aaba287b66eb"),
                    fit: BoxFit.fill,
                  )),
            ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ARIN Như Trương",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff000000),
                        fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(200),
                      child: Text("Lorem ipum Lorem ipum Lorem Lorem ipum Lorem ipum Lorem Lorem ipum Lorem ipum Lorem \nLorem ipum  ",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff000000),
                        fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,

                      )
                  ))
                ],
              ),
      ]
          ),
          Row(
            children: [
              SizedBox(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(10),
              ),
              InkWell(
                onTap: () {
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: ScreenUtil().setWidth(2)),
                  // margin: EdgeInsets.only(
                  //     top: ScreenUtil().setHeight(12),
                  //     bottom: ScreenUtil().setHeight(14)),
                  width: ScreenUtil().setWidth(16),
                  height: ScreenUtil().setHeight(16),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: true?
                      AssetImage("assets/images/like_icon.png") : AssetImage("assets/images/unlike_icon.png"),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Text("3",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: true? Color(0xffffbf2f) : Color(0xff303030),
                    fontSize: ScreenUtil().setSp(11),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}