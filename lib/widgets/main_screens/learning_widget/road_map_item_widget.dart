import 'package:flutter/material.dart';
class RoadMapItem extends StatelessWidget {
  final int index;
  final Function changeScreen;
  final Map roadMapData;
  RoadMapItem(this.index,this.roadMapData,this.changeScreen);
  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.all(10),
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
                child: InkWell(
                  onTap: (){changeScreen('listskill',roadMapData);},
                  child: Row(
                  children: [
                    Text(index.toString(),style: TextStyle(color: Colors.blue,fontSize: 30),),
                    Text(roadMapData['name'])
                  ],
                ),
                ),
              );
  }
}