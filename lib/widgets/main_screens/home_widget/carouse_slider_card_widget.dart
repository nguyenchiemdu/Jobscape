import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'workshop_card_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'workshop_database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderCard extends StatelessWidget {
  List workshopList;
  SliderCard(this.workshopList);

//   final List listJobs;
//   _SliderCardState createState() => _SliderCardState(listJobs);
// }

// class _SliderCardState extends State<SliderCard> {
//   _SliderCardState(this.listJobs);


  @override
  Widget build(BuildContext context) {
    if (workshopList == null) {
      return Text("Loading");
    } else {
      return Center(
        child: Container(
          width: ScreenUtil().setWidth(324),
          child: CarouselSlider.builder(

              itemCount: workshopList.length,
              itemBuilder: (BuildContext context, int index, realIdx) =>
                  Container(
                    child: WorkshopCard(
                        workshopList[index]['image_source'],
                        workshopList[index]['for'],
                        workshopList[index]['title'],
                        workshopList[index]['date'],
                        workshopList[index]['speaker']),
                  ),
              options: CarouselOptions(
                aspectRatio: 3/2,
                // autoPlay: true,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 300),
                // autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                viewportFraction: 0.65,
                height: ScreenUtil().setHeight(185),
                scrollDirection: Axis.horizontal,
              )),
        ),
      );
    }
  }
}
