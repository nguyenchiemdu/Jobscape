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
  final CollectionReference workshops = FirebaseFirestore.instance.collection('workshops');
  List workshopList = [];

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete((){
      print("completed");
      fetDatabaseList();
    });
  }
  fetDatabaseList() async {
    dynamic resultant = await DatabaseManager().getWorkshopList();
    if (resultant == null) {
      print("Unable to retrieve");
      workshopList = [
      {'title':'Flutter with Google Experts',
      'date': 'Feb 20, 2021',
      'link': 'meet.google.com/xmo-owif-bko',
      'image_source':'https://images.viblo.asia/1fdb8538-2e66-440c-9f34-d3105901df32.jpg',
      'speaker': 'Linh Dang'},
      {'title':'Flutter with Google Experts',
      'date': 'Feb 20, 2021',
      'link': 'meet.google.com/xmo-owif-bko',
      'image_source':'https://images.viblo.asia/1fdb8538-2e66-440c-9f34-d3105901df32.jpg',
        'speaker': 'Linh Dang'},
      {'title':'Flutter with Google Experts',
      'date': 'Feb 20, 2021',
      'link': 'meet.google.com/xmo-owif-bko',
      'image_source':'https://www.androidpolice.com/wp-content/uploads/2019/09/firebase.png',
        'speaker': 'Linh Dang'},
      {'title':'Flutter with Google Experts',
      'date': 'Feb 20, 2021',
      'link': 'meet.google.com/xmo-owif-bko',
      'image_source':'https://images.viblo.asia/1fdb8538-2e66-440c-9f34-d3105901df32.jpg',
        'speaker': 'Linh Dang'},
      ];
    } else {

      setState(() {
        workshopList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: CarouselSlider.builder(
                itemCount: workshopList.length,
                itemBuilder: (BuildContext context, int index,int realIdx) =>
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
                )
            )
        ),
      ],
    );;
  }
}