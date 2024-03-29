import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/widgets/main_screens/home_widget/workshop_database.dart';
import 'carouse_slider_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

class Workshop extends StatefulWidget {
  final Function redirectWorkshop;
  Workshop(this.redirectWorkshop);
  // var workshops = [
  // {'title':'Flutter with Google Experts',
  // 'date': 'Feb 20, 2021',
  // 'link': 'meet.google.com/xmo-owif-bko',
  // 'image_source':'https://images.viblo.asia/1fdb8538-2e66-440c-9f34-d3105901df32.jpg',
  // 'speaker': 'Linh Dang'},
  // {'title':'Flutter with Google Experts',
  // 'date': 'Feb 20, 2021',
  // 'link': 'meet.google.com/xmo-owif-bko',
  // 'image_source':'https://images.viblo.asia/1fdb8538-2e66-440c-9f34-d3105901df32.jpg',
  //   'speaker': 'Linh Dang'},
  // {'title':'Flutter with Google Experts',
  // 'date': 'Feb 20, 2021',
  // 'link': 'meet.google.com/xmo-owif-bko',
  // 'image_source':'https://www.androidpolice.com/wp-content/uploads/2019/09/firebase.png',
  //   'speaker': 'Linh Dang'},
  // {'title':'Flutter with Google Experts',
  // 'date': 'Feb 20, 2021',
  // 'link': 'meet.google.com/xmo-owif-bko',
  // 'image_source':'https://images.viblo.asia/1fdb8538-2e66-440c-9f34-d3105901df32.jpg',
  //   'speaker': 'Linh Dang'},
  // ];

  @override
  _WorkshopState createState() => _WorkshopState();
}

class _WorkshopState extends State<Workshop> {
  List workshopList = [];
  List workshopRandom = [];
  Random r = Random();
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      fetDatabaseList();
    });
  }

  fetDatabaseList() async {
    List res = await DatabaseManager().getWorkshopList();
    res.sort((a,b){
      Timestamp timea = a['date'];
      Timestamp timeb = b['date'];
      return timea.compareTo(timeb);
    });
    List resultant = await DatabaseManager().getFullWorkshop();
    List listRandom = [];
    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      List<int> listNumber = [];
      if (resultant.length > 4) {
        while (listNumber.length < 4) {
          int i = r.nextInt(resultant.length - 1);
          if (listNumber.indexOf(i) == -1) listNumber.add(i);
        }
        listNumber.forEach((i) {
          listRandom.add(resultant[i]);
        });
      } else
        listRandom = resultant;
        // print(res);
        // print(listRandom);
        listRandom.sort((a,b){
      Timestamp timea = a['date'];
      Timestamp timeb = b['date'];
      return timea.compareTo(timeb);
    });
      if (this.mounted){
        setState(() {
        workshopList = res;
        workshopRandom = listRandom;
      });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(30),
                bottom: ScreenUtil().setHeight(17)),
            width: ScreenUtil().setWidth(324),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upcoming workshops",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize:
                          ScreenUtil().setSp(14, allowFontScalingSelf: true),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )),
                // Text("See all (3)",
                //     style: TextStyle(
                //       fontFamily: 'SFProDisplay',
                //       color: Color(0xffffbf2f),
                //       fontSize:
                //           ScreenUtil().setSp(14, allowFontScalingSelf: true),
                //       fontWeight: FontWeight.w400,
                //       fontStyle: FontStyle.normal,
                //     )),
              ],
            ),
          ),
        ),
        SliderCard(workshopList, widget.redirectWorkshop),
        Container(
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 17, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recommended for you",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize:
                        ScreenUtil().setSp(14, allowFontScalingSelf: true),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
              // Text("See all (3)",
              //     style: TextStyle(
              //       fontFamily: 'SFProDisplay',
              //       color: Color(0xffffbf2f),
              //       fontSize:
              //           ScreenUtil().setSp(14, allowFontScalingSelf: true),
              //       fontWeight: FontWeight.w400,
              //       fontStyle: FontStyle.normal,
              //     )),
            ],
          ),
        ),
        SliderCard(workshopRandom, widget.redirectWorkshop),

        // GridView.count(
        //   childAspectRatio:itemHeight/itemWidth,
        //     shrinkWrap: true,
        //     scrollDirection: Axis.vertical,
        //     crossAxisCount: 2,
        //   // crossAxisSpacing: 10,
        //   // mainAxisSpacing: 10,
        //   // padding: EdgeInsets.all(10),
        //   children:
        //   List.generate(workshops.length, (index) {
        //     return Container(
        //       child: WorkshopCard(
        //           workshops[index]['image_source'],
        //           workshops[index]['link'],
        //           workshops[index]['title'],
        //           workshops[index]['date'],
        //           workshops[index]['speaker']),
        //     );
        //   } ),
        // ),
        // Container(
        //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        //     child: Text(
        //       "Most popular workshops",
        //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //     )),
        // SliderCard(),
        // // GridView.count(
        // //   childAspectRatio:itemHeight/itemWidth,
        // //   shrinkWrap: true,
        // //   scrollDirection: Axis.vertical,
        // //   crossAxisCount: 2,
        // //   // crossAxisSpacing: 10,
        // //   // mainAxisSpacing: 10,
        // //   // padding: EdgeInsets.all(10),
        // //   children:
        // //   List.generate(workshops.length, (index) {
        // //     return Container(
        // //       child: WorkshopCard(
        // //           workshops[index]['image_source'],
        // //           workshops[index]['link'],
        // //           workshops[index]['title'],
        // //           workshops[index]['date'],
        // //           workshops[index]['speaker']),
        // //     );
        // //   } ),
        // // ),
      ],
    );
  }
}
