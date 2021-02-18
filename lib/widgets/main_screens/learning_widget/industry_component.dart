import 'package:flutter/material.dart';
import './industry_slider_card.dart';
import './industry_database.dart';
import 'package:firebase_core/firebase_core.dart';

class IndustryComponent extends StatefulWidget {
  final String fieldId;
  final Function changeScreen;
  IndustryComponent(this.fieldId,this.changeScreen);
  @override
  _IndustryComponentState createState() =>
      _IndustryComponentState(this.fieldId,this.changeScreen);
}

class _IndustryComponentState extends State<IndustryComponent> {
  final String fieldId;
  final Function changeScreen;
  _IndustryComponentState(this.fieldId,this.changeScreen);
  dynamic industryField;
  final dbManager = DatabaseManager();
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      fetDatabaseList();
    });
  }

  fetDatabaseList() async {
    dynamic resultant = await dbManager.getIndustryField(fieldId);
    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      await setState(() {
        industryField = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (industryField == null) {
      return Center(
        child: Text('Loading'),
      );
    } else {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              industryField['fieldName'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(industryField['briefIntro']),
            Text(
                "+XXX Job Vacancies (show demand)\n+XY Learning Journeys to explore\nStarting salary \$xxxx"),
            SliderCard(industryField['list_jobs'],changeScreen),
          ],
        ),
        
      );
    }
  }
}
