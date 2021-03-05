import 'package:flutter/material.dart';
import 'package:learning_app/models/industry_database.dart';
class AddReviewFormWidget extends StatelessWidget {
  final path;
  AddReviewFormWidget(this.path);
  final reviewText = TextEditingController();
  final courseReviewDataBase = DatabaseManager();
  void submitReview(){
    Map<String,dynamic> reviews = {"user":"Nguyen Hai Phong","reviewText":"Default","upvote":0,"star":0,"time":"now"};
    reviews['reviewText'] = reviewText.text;
    courseReviewDataBase.addReview(reviews,path);
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