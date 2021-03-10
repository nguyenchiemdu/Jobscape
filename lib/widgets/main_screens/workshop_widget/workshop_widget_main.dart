import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/workshop_database.dart';
import 'package:learning_app/widgets/main_screens/workshop_widget/workshop_past_widget.dart';
import 'package:learning_app/widgets/main_screens/workshop_widget/workshop_reminder_widget.dart';
import 'workshop_widget.dart';

class WorkshopWidget extends StatefulWidget {
  @override
  _WorkshopWidgetState createState() => _WorkshopWidgetState();
}

class _WorkshopWidgetState extends State<WorkshopWidget> {
  List pastWorkshop = [];

  List upcomingWorkshop = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    List listWorkshop = await WorkshopDatabase().getAllWorkshop();
    List past = [];
    List upcoming = [];
    for (Map workshop in listWorkshop) {
      Timestamp timeStamp = workshop['date'];
      if (timeStamp.toDate().compareTo(DateTime.now()) < 0) {
        past.add(workshop);
      } else if (timeStamp.toDate().compareTo(DateTime.now()) > 0)
        upcoming.add(workshop);
    }
    await setState(() {
      pastWorkshop = past;
      upcomingWorkshop = upcoming;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      //    TabBar(
      //     tabs: [
      //       Tab(icon: Icon(Icons.directions_car)),
      //       Tab(icon: Icon(Icons.directions_transit)),
      //       Tab(icon: Icon(Icons.directions_bike)),
      //     ],
      //   ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          // height: 500,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/top_background.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x1a454545),
                          offset: Offset(0, 5),
                          blurRadius: 6,
                          spreadRadius: 0)
                    ],
                  ),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(110)),
                  width: ScreenUtil().setWidth(312),
                  height: ScreenUtil().setHeight(50),

                  // width: 200,
                  child: TabBar(
                    labelColor:Color(0xff000000),
                    unselectedLabelColor: Color(0xff000000),
                    indicator: BoxDecoration(
                      color: Color(0xffffbf2f),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: [
                      Tab(
                        child: Text(
                          'Past Workshops',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: ScreenUtil().setSp(13),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Upcoming Workshops',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: ScreenUtil().setSp(13),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Reminders',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: ScreenUtil().setSp(13),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Tab(icon: Icon(Icons.directions_bike)),
                    ],
                  ),
                ),
                Container(
                  height: 600,
                  child: TabBarView(
                    children: [
                      PastWorkshop(pastWorkshop),
                      Workshop(upcomingWorkshop),
                      RemindWorkshop('past'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
