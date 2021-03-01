import 'dart:convert';

import 'package:flutter/material.dart';
import 'course_infor_widget.dart';
import 'list_course_review_widget.dart';
import 'package:learning_app/models/industry_database.dart';
import 'add_coursereview_widget.dart';
class CrouseReviewScreen extends StatelessWidget {
  final Map courseItem;
  final DatabaseManager industryDataBase = DatabaseManager();
  CrouseReviewScreen(this.courseItem);
  void addReview(){
    Map review = {
      'user' : 'Nguyen Chiem Du',
      'reviewText' : 'This Course is very good',
      'upvote' : 200,
      'downvote' : 0,
      'star' : 5,
      'time' : 'a month ago'
    };
    // print(jsonEncode(review).toString());
    // industryDataBase.getReview(courseItem['courseReviewId']);
    // industryDataBase.upLoadReview(courseItem['courseReviewId']);

  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RaisedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
                CrouseInforWidget(this.courseItem),
                AddReviewFormWidget(courseItem['courseReviewId']),
                ListReviewCourse(courseItem['courseReviewId']),
                // RaisedButton(
                //   onPressed: (){addReview();},
                //   child: Text('Get review'),
                //   )
              ],
              
            ),
          )
        ),
      ),
    );
  }
}