import 'package:flutter/material.dart';
import '../welcoming_widget.dart';
import './industry_component.dart';
import './industry_slider_card.dart';

class MainLearningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Welcoming(),
              IndustryComponent('it'),
              IndustryComponent('it'),
              IndustryComponent('it'),
            ],
          ),
        ),
      ),
    );
  }
}
