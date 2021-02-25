import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'skill_item.dart';

class ListSkillWidget extends StatelessWidget {
  final Map roadMapItem;
  ListSkillWidget(this.roadMapItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
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
                Text(roadMapItem['name']),
                Container(
                  height: 500,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 1),
                    children:
                        List.generate(roadMapItem['listSkill'].length, (index) {
                      return SkillItem(roadMapItem, index);
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
