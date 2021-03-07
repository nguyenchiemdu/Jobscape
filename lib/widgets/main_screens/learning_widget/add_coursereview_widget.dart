import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/models/industry_database.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddReviewFormWidget extends StatelessWidget {
  final path;
  AddReviewFormWidget(this.path);
  final reviewText = TextEditingController();
  final courseReviewDataBase = DatabaseManager();
  void submitReview() {
    // FirebaseAuth.instance.currentUser.displayName
    Map<String, dynamic> reviews = {
      "user": FirebaseAuth.instance.currentUser.displayName,
      "reviewText": "Default",
      "upvote": 0,
      "star": 0,
      "time": DateTime.now()
    };
    reviews['reviewText'] =
        'This course is very wonderful for newbies like me. Very well explain, the professor are so helpful. Thank you Jobscape';
    courseReviewDataBase.addReview(reviews, path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter your review:'),
        TextField(
          controller: reviewText,
        ),
        RaisedButton(
          onPressed: () {
            submitReview();
          },
          child: Text('Submit'),
        )
      ],
    ));
  }
}
