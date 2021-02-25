import 'package:flutter/material.dart';
import 'course_item.dart';

class ListCourseWidget extends StatelessWidget {
  final Map skillItem;
  ListCourseWidget(this.skillItem);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                          )
                        ],
                      ),
                      Text(
                        skillItem['name'],
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: skillItem['listCourse'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return CourseItemWidget(skillItem['listCourse'][index]);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
