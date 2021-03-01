import 'package:flutter/material.dart';
import 'course_review_screen.dart';
class CourseItemWidget extends StatelessWidget {
  final Map courseItem;
  CourseItemWidget(this.courseItem);

  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CrouseReviewScreen(courseItem)),
    );
  }
  @override
  Widget build(BuildContext context) {
    // print(courseItem.toString());
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(courseItem['name']),
          Text(courseItem['recommender']),
          Text(courseItem['price'].toString()),
          Text(courseItem['star'].toString()),
          Text(courseItem['review'].toString()),
          Row(
            children: [
              RaisedButton(
                onPressed: () {},
                child: Text('Go to course'),
              ),
              RaisedButton(
                onPressed: () {changeScreen(context);},
                child: Text('See more review'),
              )
            ],
          )
        ],
      ),
    );
  }
}
