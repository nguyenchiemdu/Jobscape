import 'package:flutter/material.dart';
import './road_map_item_widget.dart';

class RoadMapWidget extends StatelessWidget {
  final Map roadMapData;
  RoadMapWidget(this.roadMapData);
  @override
  Widget build(BuildContext context) {
    // print(roadMapData.toString());
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                        fit: BoxFit.cover)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                    )
                  ],
                ),
              ),
              Text("Journey to X position",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xffffbf2f),
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.52,

                  )
              ),
              Text("Journey to X position",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xffffbf2f),
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.52,

                  )
              ),
              Text(roadMapData['name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              RoadMapItem(1, roadMapData['listRoadMap'][0]),
              RoadMapItem(2, roadMapData['listRoadMap'][1]),
              // RoadMapItem(3,roadMapData['listRoadMap'][2]['name']),
            ],
          ),
        ),
      )),
    );
  }
}
