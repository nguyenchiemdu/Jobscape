import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Welcoming extends StatelessWidget {
  var tx = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Today is " + DateFormat.yMMMMd().format(tx),
              textAlign: TextAlign.left,),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Text("\"Develop a passion for learning. If you do, you will never cease to grow.\"")
          ),


        ],
      ),
    );
  }
}


