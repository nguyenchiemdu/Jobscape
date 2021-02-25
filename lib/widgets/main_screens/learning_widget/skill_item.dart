import 'package:flutter/material.dart';
import 'list_course_widget.dart';

class SkillItem extends StatelessWidget {
  final Map roadMapItem;
  final int index;
  SkillItem(this.roadMapItem, this.index);

  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ListCourseWidget(roadMapItem['listSkill'][index])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        // borderRadius: BorderRadius.circular(100)
      ),
      child: InkWell(
        onTap: () {
          changeScreen(context);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(roadMapItem['listSkill'][index]['name']),
            ],
          ),
        ),
      ),
    );
  }
}
