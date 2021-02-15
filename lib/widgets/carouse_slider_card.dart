import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'workshop_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'workshop_database.dart';

class SliderCard extends StatefulWidget {
  _SliderCardState createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  final CollectionReference workshops =
      FirebaseFirestore.instance.collection('workshops');
  List workshopList;
  //  = [
  //   {'title': '', 'date': '', 'link': '', 'image_source': '', 'speaker': ''},
  //   {'title': '', 'date': '', 'link': '', 'image_source': '', 'speaker': ''},
  //   {'title': '', 'date': '', 'link': '', 'image_source': '', 'speaker': ''},
  // ];

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      fetDatabaseList();
    });
  }

  fetDatabaseList() async {
    dynamic resultant = await DatabaseManager().getWorkshopList();
    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      await setState(() {
        workshopList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (workshopList == null) {
      return Center(
        child: Text('Loading'),
      );
    } else {
      return Column(
        children: [
          Center(
              child: CarouselSlider.builder(
                  itemCount: workshopList.length,
                  itemBuilder: (BuildContext context, int index, realIdx) =>
                      WorkshopCard(
                          workshopList[index]['image_source'],
                          workshopList[index]['link'],
                          workshopList[index]['title'],
                          workshopList[index]['date'],
                          workshopList[index]['speaker']),
                  options: CarouselOptions(
                    height: 120,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                    scrollDirection: Axis.horizontal,
                  ))),
        ],
      );
    }
    ;
  }
}
