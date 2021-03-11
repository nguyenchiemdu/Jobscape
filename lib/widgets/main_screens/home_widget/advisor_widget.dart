import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// List advisors = [
//   {'avatar': "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/154820818/original/d11d5ab6b277593937ca5fbc8aacec31726e2f88/design-professional-avatar-minimalist.png",
//     'name' : 'Vu Thanh Long'
//   },
//   {'avatar': "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJUtagRl37SuKw4XZdyV9H5xsfxKVnFgvFiQ&usqp=CAU",
//     'name' : 'Nguyen Chiem Du'
//   },{'avatar': "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/149993805/original/f745b6ce44db4e40ff8bba54a7ade15a05c3163b/design-professional-avatar-with-big-head-and-minimalist.jpg",
//     'name' : 'Nhu Truong'
//   },{'avatar': "https://png.pngtree.com/png-clipart/20190516/original/pngtree-woman-avatar-professional-icon-woman-flat-icon-woman-avatar-woman-character-png-image_3674162.jpg",
//     'name' : 'Anh Ninh'
//   },{'avatar': "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/154820818/original/d11d5ab6b277593937ca5fbc8aacec31726e2f88/design-professional-avatar-minimalist.png",
//     'name' : 'Phong Nguyen'
//   },{'avatar': "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/154820818/original/d11d5ab6b277593937ca5fbc8aacec31726e2f88/design-professional-avatar-minimalist.png",
//     'name' : 'Vu Thanh Long'
//   },
// ];


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
          Center(
            child: Container(
              width: ScreenUtil().setWidth(324),
              margin: EdgeInsets.only(top:ScreenUtil().setHeight(30), bottom: ScreenUtil().setHeight(20)),
              child: Text("Our Advisors",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff000000),
                    fontSize: ScreenUtil().setSp(14),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )
              ),
            ),
          ),
          Container(
            //padding: EdgeInsets.only(left: 32,right: 32,top: 24),
            // padding: EdgeInsets.only(top:20,right:10,left:10),
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
                        width: ScreenUtil().setWidth(139),
                        height: ScreenUtil().setHeight(55),
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/logo_facebook.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(139),
                        height: ScreenUtil().setHeight(55),
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/logo_vng.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: ScreenUtil().setWidth(17)),
                      width: ScreenUtil().setWidth(123),
                      height: ScreenUtil().setHeight(49),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo_fpt.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(right: ScreenUtil().setWidth(17)),
                      width: ScreenUtil().setWidth(125),
                      height: ScreenUtil().setHeight(49),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo_viettel.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),),
                Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(right: ScreenUtil().setWidth(17)),
                      width: ScreenUtil().setWidth(101),
                      height: ScreenUtil().setHeight(40),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo_paypal.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(right: ScreenUtil().setWidth(17)),
                      width: ScreenUtil().setWidth(104),
                      height: ScreenUtil().setHeight(40),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo_sun.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(right: ScreenUtil().setWidth(17)),
                      width: ScreenUtil().setWidth(101),
                      height: ScreenUtil().setHeight(40),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo_snorke.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),),
                  Container(
                  // margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(right: ScreenUtil().setWidth(17)),
                      width: ScreenUtil().setWidth(101),
                      height: ScreenUtil().setHeight(40),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo_vinbigdata.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(right: ScreenUtil().setWidth(17)),
                      width: ScreenUtil().setWidth(104),
                      height: ScreenUtil().setHeight(40),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo_cyrada.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(right: ScreenUtil().setWidth(17)),
                      width: ScreenUtil().setWidth(101),
                      height: ScreenUtil().setHeight(40),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/logo_phenikaa.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            )
          ),

        ],
      );
  }
}