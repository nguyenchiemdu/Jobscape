import 'package:flutter/material.dart';
import 'workshop_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderCard extends StatelessWidget {
  final List workshopList;
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
      //   return Center(
      //     child: Container(
      //       width: ScreenUtil().setWidth(324),
      //       child: CarouselSlider.builder(
      //
      //           itemCount: workshopList.length,
      //           itemBuilder: (BuildContext context, int index, realIdx) =>
      //               Container(
      //                 child: WorkshopCard(
      //                     workshopList[index]['image_source'],
      //                     workshopList[index]['for'],
      //                     workshopList[index]['title'],
      //                     workshopList[index]['date'],
      //                     workshopList[index]['speaker']),
      //               ),
      //           options: CarouselOptions(
      //             aspectRatio: 3/2,
      //             // autoPlay: true,
      //             // autoPlayInterval: Duration(seconds: 3),
      //             // autoPlayAnimationDuration: Duration(milliseconds: 300),
      //             // autoPlayCurve: Curves.fastOutSlowIn,
      //             enlargeCenterPage: false,
      //             viewportFraction: 0.65,
      //             height: ScreenUtil().setHeight(185),
      //             scrollDirection: Axis.horizontal,
      //           )),
      //     ),
      //   );
      // }
      return Center(
        child: Container(
            width: ScreenUtil().setWidth(324),
            height: ScreenUtil().setHeight(192),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: workshopList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: WorkshopCard(
                    workshopList[index]['image_source'],
                    workshopList[index]['for'],
                    workshopList[index]['title'],
                    workshopList[index]['date'],
                    workshopList[index]['speaker']),
              );
            },
          )
        ),
      );
    }
  }
}
