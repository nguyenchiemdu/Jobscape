import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/widgets/main_screens/question_widget/list_filter_card.dart';
import 'package:learning_app/widgets/main_screens/question_widget/tag_card.dart';
import 'incognito_mode_widget.dart';

class AddQuestionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IncognitoModeWidget(false),
          Center (
          child: Container(
            width: ScreenUtil().setWidth(312),
            height: ScreenUtil().setHeight(85),
            decoration: new BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                  color: Color(0x1a454545),
                  offset: Offset(0,5),
                  blurRadius: 6,
                  spreadRadius: 0
                  ) ],
              ),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(hintText: "What's your question?",
                  contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(14),top: ScreenUtil().setHeight(17)),
                  border: InputBorder.none,
                    suffixIcon: IconButton(icon: Icon(Icons.send_rounded, color: Color(0xffffbf2f)),
                      onPressed:() {})
                  )
                ),
                ListFilter(),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
