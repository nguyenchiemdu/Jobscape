import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'industry_card.dart';
import 'package:learning_app/models/industry_database.dart';

class SliderCard extends StatefulWidget {
  SliderCard(this.fieldId);
//   final List listJobs;
//   _SliderCardState createState() => _SliderCardState(listJobs);
// }

// class _SliderCardState extends State<SliderCard> {
//   _SliderCardState(this.listJobs);
  final String fieldId;

  @override
  _SliderCardState createState() => _SliderCardState(fieldId);
}

class _SliderCardState extends State<SliderCard> {
  List listJobs;
  final String fieldId;
  _SliderCardState(this.fieldId);
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    List res = await DatabaseManager().getListJobs(fieldId);
    // print(jsonEncode(res[0]));
    // if (fieldId == 'Sx5B6kCWcLtqoD4HjVMM') addJob();
    setState(() {
      listJobs = res;
      // print(listJobs[0]['path']);
    });
    // for (int i=0;i<res[0]['listRoadMap'].length;i++){
    //   DatabaseManager().addJob(res[0]['listRoadMap'][i],path: res[0]['path']);
    // }
  }

  void addJob() async {
    Map<String, dynamic> job = {
      "imgSrc": "https://wallpapercave.com/wp/wp1912957.jpg",
      "jobOpportunity": 37000,
      "name": "Social Media Manager",
      "salary": 800,
    };
    await DatabaseManager().addJob(job, fieldId: fieldId);
  }

  @override
  Widget build(BuildContext context) {
    if (listJobs == null)
      return Center(
        child: Text('Loading'),
      );
    else
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Center(
            child: CarouselSlider.builder(
                itemCount: listJobs.length,
                itemBuilder: (BuildContext context, int index, realIdx) =>
                    FittedBox(
                      child: Container(
                        child: IndustryCard(
                          listJobs[index],
                        ),
                      ),
                    ),
                options: CarouselOptions(
                  // autoPlay: true,
                  // autoPlayInterval: Duration(seconds: 3),
                  // autoPlayAnimationDuration: Duration(milliseconds: 300),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  // enlargeCenterPage: false,
                  viewportFraction: 0.65,
                  scrollDirection: Axis.horizontal,
                ))),
      );
  }
}
