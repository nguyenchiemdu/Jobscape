import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:24,top:28),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right:18),
              width: 170,
              height: 168,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(40),
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                border: Border.all(
                  color: Color(0xffffefcc),
                  width: 3
                ),
                color: Color(0xffffffff),
                boxShadow: [BoxShadow(
                    color: Color(0x1a454545),
                    offset: Offset(0,10),
                    blurRadius: 10,
                    spreadRadius: 0
                ) ],
              )
          ),
          Container(
              width: 170,
              height: 168,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(40),
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                border: Border.all(
                    color: Color(0xffffefcc),
                    width: 3
                ),
                color: Color(0xffffffff),
                boxShadow: [BoxShadow(
                    color: Color(0x1a454545),
                    offset: Offset(0,10),
                    blurRadius: 10,
                    spreadRadius: 0
                ) ],
              )
          ),
        ],
      ),
    );
  }
}