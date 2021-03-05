import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:learning_app/widgets/main_screens/home_widget/advisor_widget.dart';
import 'package:learning_app/widgets/main_screens/home_widget/ourteam_widget.dart';
import 'package:learning_app/widgets/main_screens/home_widget/progress.dart';
import './workshop_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import './industry_introduction_widget.dart';
import '../welcoming_widget.dart';
import '../learning_widget/learning_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeUsedWidget extends StatelessWidget {
  // final Function selectPage;
  // HomeUsedWidget(this.selectPage);
  dynamic tx = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          child: SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(392),
                        width: ScreenUtil().setWidth(360),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/top_background.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                    color: Color(0xfffffdfa),
                    boxShadow: [BoxShadow(
                        color: Color(0x19454545),
                        offset: Offset(0,3),
                        blurRadius: 6,
                        spreadRadius: 0
                    )],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                ),
                 ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:ScreenUtil().setHeight(110)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 21,right:12),
                                    width: ScreenUtil().setWidth(48),
                                    height: ScreenUtil().setWidth(48),
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'https://bizweb.dktcdn.net/100/175/849/files/chup-anh-profile-doanh-nhan-chan-dung-nghe-nghiep-dep-o-ha-noi-12.jpg?v=1556771914677#.YCeLPA8sis8.link'),
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: ScreenUtil().setWidth(258),
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                child: Text("Hello "+ Provider.of<GoogleSignInProvider>(context, listen: false).displayName,
                                                    style: TextStyle(
                                                      fontFamily: 'SFProDisplay',
                                                      color: Color(0xff000000),
                                                      fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                                                      fontWeight: FontWeight.w700,
                                                      fontStyle: FontStyle.normal,
                                                    )
                                                )),
                                            Container(
                                              child: Text(
                                                "Today is " + DateFormat.yMMMMd().format(tx),
                                                style: TextStyle(
                                                  fontFamily: 'SFProDisplay',
                                                  color: Color(0xff000000),
                                                  fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle: FontStyle.normal,

                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: ScreenUtil().setWidth(258),
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Text("\"Plant your garden and decorate your own soul, instead of waiting for someone to bring you flowers.\"",
                                            style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xff000000),
                                              fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                            )
                                        ),
                                      )
                                    ],

                                  )

                                ],
                              ),
                            ),
                            Progress(),
                          ],
                        ),
                      ),


                      // IndustryIntro(),
                      Workshop(),
                      // SliderCard(),
                      // SliderCard(),
                      // SliderCard(),
                      Advisor(),
                      OurTeam(),
                      RaisedButton(
                        onPressed: () {
                          final provider =
                          Provider.of<GoogleSignInProvider>(context, listen: false);
                          provider.logout();
                        },
                        child: Text('Logg out'),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
