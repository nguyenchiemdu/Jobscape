import 'package:flutter/material.dart';
import 'package:learning_app/models/industry_database.dart';
import 'package:firebase_core/firebase_core.dart';
class ListReviewCourse extends StatefulWidget {
  final String courseReviewid;
  ListReviewCourse(this.courseReviewid);
  @override
  _ListReviewCourseState createState() => _ListReviewCourseState(courseReviewid);
}

class _ListReviewCourseState extends State<ListReviewCourse> {
  _ListReviewCourseState(this.courseReviewid);
  final String courseReviewid;
  List listReview;
  final DatabaseManager courseReviewDatabase = DatabaseManager();
  @override
  void initState() {
    super.initState();
      fetchData();
    
    
  }
  void fetchData() async{
    final List resultant =  await this.courseReviewDatabase.getReview(this.courseReviewid);
    setState(() {
        listReview = resultant;
      });
  }
  void udpateData(List newData){
    setState((){
      listReview = newData;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(listReview == null) {return Center(child: Text('loading'),);} 
    else  return Container(
      height: 300,
      child: ListView.builder(
          itemCount: listReview.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
             
              child :Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listReview[index]['user']),
                  Text(listReview[index]['time']),
                  Text(listReview[index]['reviewText']),
                  
                  Row(children: [
                    Text(' Upvote :'+ listReview[index]['upvote'].toString()),
                    Text(' Downvote :'+ listReview[index]['downvote'].toString()),
                    
                  ],)
                  
                ],
              ),
            );
          }
),
    );
  }
}