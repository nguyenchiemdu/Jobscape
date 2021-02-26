import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'industry_card.dart';

class SliderCard extends StatelessWidget {
  SliderCard(this.listJobs);
//   final List listJobs;
//   _SliderCardState createState() => _SliderCardState(listJobs);
// }

// class _SliderCardState extends State<SliderCard> {
//   _SliderCardState(this.listJobs);
  final List listJobs;
  @override
  Widget build(BuildContext context) {
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
