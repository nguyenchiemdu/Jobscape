import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:learning_app/widgets/Industry_introduction.dart';
import 'package:learning_app/widgets/workshop.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'welcoming.dart';
import 'Industry_introduction.dart';
import 'carouse_slider_card.dart';

class LoggedInWidget extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                margin: EdgeInsets.all(10),
                  child: Text("Hello Long")),
              Container(
                margin: EdgeInsets.all(20),
                width: 60,
                  height: 60,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage('https://bizweb.dktcdn.net/100/175/849/files/chup-anh-profile-doanh-nhan-chan-dung-nghe-nghiep-dep-o-ha-noi-12.jpg?v=1556771914677#.YCeLPA8sis8.link'),
                        fit: BoxFit.fill,
                    )
                  ),
                   ),
            ],),
            Welcoming(),

            Text("[App Name] is a...."),
            Text("Explore +XXX customized learning journeys for XXX job positions from XXX industries with value-based prioritization recommended by +YYY professionals at no cost now"),
            IndustryIntro(),
            Workshop(),
            // SliderCard(),
            // SliderCard(),
            // SliderCard(),
            Center(child: Text('LoggedIn'),),
            RaisedButton(onPressed: (){
              final provider =
                  Provider.of<GoogleSignInProvider>(context,listen: false);
                provider.logout();
            },child: Text('Logg out'),)
          ],
        ),
      ),
    );
  }
}