import 'package:flutter/material.dart';

class WorkshopCard extends StatelessWidget {
  String image_source;
  String link;
  String title;
  String date;
  String speaker;

  WorkshopCard(this.image_source, this.link, this.title, this.date,
      this.speaker);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.green,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        height: 100,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,),
                ),
                child: Image.network(image_source),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 110,
                      child: Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                  Text(date, style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                  Text(speaker,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                  Container(
                      child: Text(link, style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic )),
                  width: 110,)
                ],
              )
            ]
        ),
      );
  }
}