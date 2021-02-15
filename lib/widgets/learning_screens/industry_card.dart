import 'package:flutter/material.dart';

class IndustryCard extends StatelessWidget {
  String image_source;
  String name;
  String job_opportunity;
  String salary;

  IndustryCard(this.image_source, this.name, this.job_opportunity, this.salary);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        // height: 100,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: Image.network(
                image_source,
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
                    name,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  Text(
                    'Job Opportunity: ' + job_opportunity,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'Salary: ' + salary + '\$',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              )
            ]),
          ],
        ));
  }
}
