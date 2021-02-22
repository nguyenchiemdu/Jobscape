import 'package:flutter/material.dart';

class WorkshopCard extends StatelessWidget {
  String image_source;
  String for_whom;
  String title;
  String date;
  String speaker;

  WorkshopCard(this.image_source, this.for_whom, this.title, this.date,
      this.speaker);

  @override
  Widget build(BuildContext context) {
    return
      Container(
          decoration: new BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(
                color: Color(0x26454545),
                offset: Offset(0,5),
                blurRadius: 6,
                spreadRadius: 0,
            ) ],
          ),
        height: 185,
        width: 192,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                margin: EdgeInsets.only(top:5, right:5, left: 5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(image_source,
                    fit: BoxFit.fill,
                    width: 182,
                    height: 99),),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, left:12, right: 5, bottom: 4),
                child: Text(title,
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12, bottom: 3),
                child: Row(
                  children: [
                    Container(
                        width: 12,
                        height: 12,
                        margin: EdgeInsets.only(right: 4),
                        child: Image.asset("assets/images/good_for_icon.png")),
                    Container(
                      child: Text(for_whom,
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: 9,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12, bottom: 3),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right:4),
                        width: 12,
                        height: 12,
                        child: Image.asset("assets/images/speaker_icon.png")),
                    Text(speaker,
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff000000),
                          fontSize: 9,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,


                        )
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Container(
                        width: 12,
                        height: 12,
                        child: Image.asset("assets/images/date_icon.png")),
                    Text(date,
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff000000),
                          fontSize: 9,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,


                        )
                    )
                  ],
                ),
              ),
            ]
        ),
      );
  }
}