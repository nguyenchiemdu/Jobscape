import 'package:flutter/material.dart';
import 'workshop_widget.dart';
class WorkshopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar:
      //    TabBar(
      //     tabs: [
      //       Tab(icon: Icon(Icons.directions_car)),
      //       Tab(icon: Icon(Icons.directions_transit)),
      //       Tab(icon: Icon(Icons.directions_bike)),
      //     ],
      //   ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          // height: 500,
          child: Column(
            children: [
              Container(
                // width: 200,
                child: TabBar(
                  indicatorColor: Colors.yellow,
                  
                  tabs: [
                    Tab(child: Text('Past Workshops'),),
                    Tab(child: Text('Upcoming Workshops'),),
                    Tab(child: Text('Reminders'),),
                    // Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
              ),
              Container(
                height: 600,
                child: TabBarView(
                
                children: [
                  Workshop('past'),
                  Workshop('upcoming'),
                  Icon(Icons.directions_car),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}