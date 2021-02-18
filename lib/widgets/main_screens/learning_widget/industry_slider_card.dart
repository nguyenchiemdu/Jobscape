import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'industry_card.dart';

class SliderCard extends StatelessWidget {
  SliderCard(this.listJobs,this.changeScreen);
//   final List listJobs;
//   _SliderCardState createState() => _SliderCardState(listJobs);
// }

// class _SliderCardState extends State<SliderCard> {
//   _SliderCardState(this.listJobs);
  final List listJobs;
  final Function changeScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: CarouselSlider.builder(
                itemCount: listJobs.length,
                itemBuilder: (BuildContext context, int index, realIdx) =>
                    IndustryCard(
                      listJobs[index],
                      changeScreen,
                    ),
                options: CarouselOptions(
                  height: 250,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  scrollDirection: Axis.horizontal,
                ))),
      ],
    );
  }
}
