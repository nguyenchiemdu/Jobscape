import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListSkillWidget extends StatelessWidget {
  final Function changeScreen;
  final Map roadMapItem;
  ListSkillWidget(this.changeScreen,this.roadMapItem);
  @override
  Widget build(BuildContext context) {
    print(roadMapItem.toString());
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                              "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
                              ),
                                    fit: BoxFit.cover
                        )
                    ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(onPressed: (){changeScreen('roadmap',null);},
                        child: Icon(Icons.arrow_back),
                      ),
                      RaisedButton(onPressed: (){},
                        child: Icon(Icons.favorite,color: Colors.pink,),
                      )
                    ],
                  ),
                  ),
                  Text(roadMapItem['name']),
            ],
          ),
        ),
      ),
    );
  }
}