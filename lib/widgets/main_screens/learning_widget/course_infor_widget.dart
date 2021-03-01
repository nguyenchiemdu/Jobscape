import 'package:flutter/material.dart';

class CrouseInforWidget extends StatelessWidget {
  final Map courseInfor;
  CrouseInforWidget(this.courseInfor);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(courseInfor['name']),
          Text('Rating '+courseInfor['star'].toString()),
        ],
      ),
    );
  }
}