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
        color: Colors.green,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        // height: 100,
        child: InkWell(
          onTap: (){changeScreen('roadmap',jobData);},
          child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: Image.network(
                jobData['img_src'],
                height: 130,
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      // width: ,

                      child: Text(
                    jobData['name'],
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  Text(
                    'Job Opportunity: ' + jobData['job_opportunity'].toString(),
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'Salary: ' + jobData['salary'].toString() + '\$',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              )
            ]),
          ],
        ),
        ));
  }
}
