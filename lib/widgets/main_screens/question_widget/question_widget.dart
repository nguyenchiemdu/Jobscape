import 'package:flutter/material.dart';
import 'enter_question_form.dart';

class QuestionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              AddQuestionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
