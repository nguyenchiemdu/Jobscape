import 'package:flutter/material.dart';

class CourseItemWidget extends StatelessWidget {
  final Map courseItem;
  CourseItemWidget(this.courseItem);
  @override
  Widget build(BuildContext context) {
    print(courseItem.toString());
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
                onPressed: () {},
                child: Text('See more review'),
              )
            ],
          )
        ],
      ),
    );
  }
}
