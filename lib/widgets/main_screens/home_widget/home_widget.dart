import 'package:flutter/material.dart';
import 'package:learning_app/models/google_sign_in.dart';
import './workshop_widget.dart';
import 'package:provider/provider.dart';

import './industry_introduction_widget.dart';
import '../welcoming_widget.dart';
import '../learning_widget/learning_widget.dart';

class HomeWidget extends StatelessWidget {
  void changeRoute(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainLearningScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
            child: Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.all(10), child: Text("Hello Long")),
                Container(
                  margin: EdgeInsets.all(20),
                  width: 60,
                  height: 60,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://bizweb.dktcdn.net/100/175/849/files/chup-anh-profile-doanh-nhan-chan-dung-nghe-nghiep-dep-o-ha-noi-12.jpg?v=1556771914677#.YCeLPA8sis8.link'),
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            ),
            Welcoming(),

            Text("[App Name] is a...."),
            Text(
                "Explore +XXX customized learning journeys for XXX job positions from XXX industries with value-based prioritization recommended by +YYY professionals at no cost now"),
            IndustryIntro(),
            Workshop(),
            // SliderCard(),
            // SliderCard(),
            // SliderCard(),
            RaisedButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text('Logg out'),
            ),
          ],
        ),
      ),
    )));
  }
}
