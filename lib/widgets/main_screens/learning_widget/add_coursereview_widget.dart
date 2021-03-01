import 'package:flutter/material.dart';
import 'package:learning_app/models/industry_database.dart';
class AddReviewFormWidget extends StatelessWidget {
  final courseReviewId;
  AddReviewFormWidget(this.courseReviewId);
  final reviewText = TextEditingController();
  final courseReviewDataBase = DatabaseManager();
  void submitReview(){
    courseReviewDataBase.upLoadReview(courseReviewId,reviewText.text);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text('Enter your review:'),
          TextField(
            controller: reviewText ,
          ),
          RaisedButton(
            onPressed: (){submitReview();},
            child: Text('Submit'),
          )
        ],
      )
      
    );
  }
}