import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'road_map_widget.dart';

class IndustryCard extends StatelessWidget {
  // String image_source;
  // String name;
  // String job_opportunity;
  // String salary;
  final Map jobData;
  IndustryCard(this.jobData);
  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              RoadMapWidget(this.jobData, this.jobData['path'])),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(jobData.toString());
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: InkWell(
          onTap: () {
            changeScreen(context);
          },
          child: Container(
            width: ScreenUtil().setWidth(217),
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                    color: Color(0x26454545),
                    offset: Offset(0, 5),
                    blurRadius: 6,
                    spreadRadius: 0)
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 9, top: 5, right: 5, left: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:
                        // Image.network(
                        // jobData['imgSrc'],
                        CachedNetworkImage(
                      imageUrl: jobData['imgSrc'],
                      // placeholder: (context, url) => Image(
                      //     image: AssetImage('assets/images/top_image.png')),
                      // CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.fill,
                      width: ScreenUtil().setWidth(207),
                      height: ScreenUtil().setHeight(120),
                    ),
                  ),
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 7, left: 13),
                        width: ScreenUtil().setWidth(170),
                        child: Text(jobData['name'],
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff000000),
                              fontSize: ScreenUtil().setSp(14),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            )),
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
                            Text(
                                "Job opportunity: " +
                                    jobData['jobOpportunity'].toString(),
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff000000),
                                  fontSize: ScreenUtil().setSp(10),
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 13, right: 4),
                              width: 13,
                              height: 13,
                              child:
                                  Image.asset("assets/images/salary_icon.png"),
                            ),
                            Text(
                                'Salary: ' + '\$' +
                                    jobData['salary'].toString()
                                    ,
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff000000),
                                  fontSize: ScreenUtil().setSp(10),
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                ))
                          ],
                        ),
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
