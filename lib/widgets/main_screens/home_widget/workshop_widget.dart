import 'package:flutter/material.dart';
import 'carouse_slider_card_widget.dart';

class Workshop extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Text(
              "Upcoming workshops",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Text(
              "Today",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        SliderCard(),
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
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Text(
              "Most popular workshops",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        SliderCard(),
        // GridView.count(
        //   childAspectRatio:itemHeight/itemWidth,
        //   shrinkWrap: true,
        //   scrollDirection: Axis.vertical,
        //   crossAxisCount: 2,
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
      ],
    );
  }
}
