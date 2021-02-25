import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List advisors = [
  {'avatar': "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/154820818/original/d11d5ab6b277593937ca5fbc8aacec31726e2f88/design-professional-avatar-minimalist.png",
    'name' : 'Vu Thanh Long'
  },
  {'avatar': "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJUtagRl37SuKw4XZdyV9H5xsfxKVnFgvFiQ&usqp=CAU",
    'name' : 'Nguyen Chiem Du'
  },{'avatar': "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/149993805/original/f745b6ce44db4e40ff8bba54a7ade15a05c3163b/design-professional-avatar-with-big-head-and-minimalist.jpg",
    'name' : 'Nhu Truong'
  },{'avatar': "https://png.pngtree.com/png-clipart/20190516/original/pngtree-woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png-image_3674162.jpg",
    'name' : 'Anh Ninh'
  },{'avatar': "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/154820818/original/d11d5ab6b277593937ca5fbc8aacec31726e2f88/design-professional-avatar-minimalist.png",
    'name' : 'Phong Nguyen'
  },{'avatar': "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/154820818/original/d11d5ab6b277593937ca5fbc8aacec31726e2f88/design-professional-avatar-minimalist.png",
    'name' : 'Vu Thanh Long'
  },
];


class Advisor extends StatelessWidget {


  Widget build(BuildContext context) {
    @override
    var size = MediaQuery.of(context).size;

/*24 is for notification bar on Android*/
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;
    return
      Column(
        children: [
          Container(
            width: ScreenUtil().setWidth(324),
            margin: EdgeInsets.only(top:ScreenUtil().setHeight(30), bottom: ScreenUtil().setHeight(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Our Advisors",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff000000),
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,


                    )
                ),
                Text("See all (5)",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xffffbf2f),
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,


                    )
                )
              ],
            ),
          ),
          Container(
            //padding: EdgeInsets.only(left: 32,right: 32,top: 24),
            padding: EdgeInsets.only(top:20,right:10,left:10),

            width: ScreenUtil().setHeight(324),
            height: ScreenUtil().setHeight(250),
          decoration: new BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(
              color: Color(0x19454545),
              offset: Offset(0,3),
              blurRadius: 6,
              spreadRadius: 0
              ) ],
              ),
            child: GridView.count(
                  // childAspectRatio:itemWidth/itemHeight,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  // crossAxisSpacing: 34,
                  // mainAxisSpacing: 18,
                // padding: EdgeInsets.all(10),
                children:
                List.generate(advisors.length, (index) {
                  return Container(
                    // margin: EdgeInsets.only(bottom: 18),
                    child: Column(
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(60),
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    advisors[index]['avatar']),
                                    fit: BoxFit.fill,
                              )),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(58),
                          margin: EdgeInsets.only(top: 8),
                          child: Text(advisors[index]['name'],
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: ScreenUtil().setSp(12),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                              ),
                            textAlign: TextAlign.center ,
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
          ),
        ],
      );
  }
}