import 'package:flutter/material.dart';
import 'incognito_mode_widget.dart';

class AddQuestionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('User Name'),
              Row(
                children: [
                  Text('Incognito Mode'),
                  IncognitoModeWidget(false),
                ],
              )
            ],
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(hintText: 'What is your question ?'),
          ),
        ],
      ),
    );
  }
}
