import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndustryCard extends StatelessWidget {
  // String image_source;
  // String name;
  // String job_opportunity;
  // String salary;
  final Map jobData ;
  final Function changeScreen;
  IndustryCard(this.jobData,this.changeScreen);

  @override
  Widget build(BuildContext context) {
    // print(jobData.toString());
    return Container(

        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: InkWell(
          onTap: (){changeScreen('roadmap',jobData);},
          child:
          Container(
            width: 220,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffffffff),
              boxShadow: [BoxShadow(
                  color: Color(0x26454545),
                  offset: Offset(0,5),
                  blurRadius: 6,
                  spreadRadius: 0
              ) ],
            ),
            child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 9, top:5, right:5, left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    jobData['img_src'],
                    fit: BoxFit.fill,
                    width: 197,
                    height: 107,
                  ),
                ),
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 7, left: 13),
                      child: Text(jobData['name'],
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
                      margin: EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 13, right: 4),
                            width: 13,
                            height: 13,
                            child: Image.asset("assets/images/job_icon.png"),
                            ),
                          Text("Job opportunity: "+ jobData['job_opportunity'].toString(),
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
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 13, right: 4),
                          width: 13,
                          height: 13,
                          child: Image.asset("assets/images/salary_icon.png"),
                        ),
                        Text('Salary: ' + jobData['salary'].toString() + '\$',
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
                  ],
                )
              ]),
            ],
        ),
          ),
        ));
  }
}
