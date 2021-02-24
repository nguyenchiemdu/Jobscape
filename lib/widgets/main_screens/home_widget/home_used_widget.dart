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

class HomeUsedWidget extends StatelessWidget {
  // final Function selectPage;
  // HomeUsedWidget(this.selectPage);
  dynamic tx = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/top_background.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:110),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 21,right:12),
                                  width: 48,
                                  height: 48,
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
                                      width: 306,
                                      margin: EdgeInsets.only(bottom: 4,right:24),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              child: Text("Hello Như,",
                                                  style: TextStyle(
                                                    fontFamily: 'SFProDisplay',
                                                    color: Color(0xff000000),
                                                    fontSize: 14,
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
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                fontStyle: FontStyle.normal,

                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 306,
                                      margin: EdgeInsets.only(bottom: 4,right:24),
                                      child: Text("\"Plant your garden and decorate your own soul, instead of waiting for someone to bring you flowers.\"",
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            color: Color(0xff000000),
                                            fontSize: 12,
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
