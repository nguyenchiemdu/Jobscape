import 'package:flutter/material.dart';
import 'list_skill_widget.dart';

class RoadMapItem extends StatelessWidget {
  final int index;
  final Map roadMapData;
  RoadMapItem(this.index, this.roadMapData);
  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListSkillWidget(this.roadMapData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.yellow,
      ),
      child: InkWell(
        onTap: () {
          changeScreen(context);
        },
        child: Row(
          children: [
            Text(
              index.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            Text(roadMapData['name'])
          ],
        ),
      ),
    );
  }
}
