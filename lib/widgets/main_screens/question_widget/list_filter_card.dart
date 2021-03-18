import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/widgets/main_screens/question_widget/tag_card.dart';

class ListFilter extends StatelessWidget {
  final Function changeTag;
  ListFilter(this.changeTag);
  List<String> listTag = ["Frontend Web Development","Backend Web Development","Data Science","Machine Learning","UI/UX Design","Android Development","iOS Development"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i< listTag.length; i++)
            FilterCard(listTag[i],changeTag)
        ],
      ),
    );
  }
}