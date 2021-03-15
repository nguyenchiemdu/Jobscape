import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:learning_app/models/workshop_database.dart';
import 'package:permission_handler/permission_handler.dart';
import 'carouse_slider_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

class Workshop extends StatefulWidget {
  final List upcomingWorkshop;
  Workshop(this.upcomingWorkshop);

  @override
  _WorkshopState createState() => _WorkshopState();
}

class _WorkshopState extends State<Workshop> {
  DateTime selectedDate = DateTime.now();

  TextEditingController date = new TextEditingController();
  TextEditingController workshopName = TextEditingController();
  TextEditingController speaker = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController participants = TextEditingController();
  TextEditingController linkToJoin = TextEditingController();
  TextEditingController contactInfo = TextEditingController();
  DateTime picked;
  PickedFile image;
  Future<Null> _selectDate(BuildContext context) async {
    picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date.value =
            TextEditingValue(text: DateFormat('MMM dd, y').format(picked));
      });
  }

  submit() async {
    final _storage = FirebaseStorage.instance;
    String uid = FirebaseAuth.instance.currentUser.uid;

    if (image != null) {
      var file = File(image.path);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      //upload to FireBase
      var _snapshot = await _storage
          .ref()
          .child('WorkshopImg/$uid/$fileName')
          .putFile(file)
          .whenComplete(
              () => print('Upload Workshop Image  to Storage complete'))
          .onError((error, stackTrace) {
        print('Failed to upload Image:' + error);
        return null;
      });
      var downloadURLs = await _snapshot.ref.getDownloadURL();
      //upload to Firestore
      Map<String, dynamic> data = {
        'date': Timestamp.fromDate(picked),
        'for': participants.text,
        'image_source': downloadURLs,
        'speaker': speaker.text,
        'title': workshopName.text,
        'organizationContact': contactInfo.text,
        'link': linkToJoin.text,
        'description': description.text,
        'status': false,
        'fromUser': true
      };

      await WorkshopDatabase().AddWorkshop(data);
    } else {
      print('No Path received or No Skill Name received');
    }
  }

  uploadImage() async {
    final _picker = ImagePicker();

    //CHeck permission
    // await Permission.photos.request();
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
    } else {
      print('Grand permissions and try again');
    }
  }

  List todayWorkshop = [];
  List upComingWorkshop = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    // print(widget.upcomingWorkshop);
    Timestamp now = Timestamp.now();
    DateFormat form = DateFormat('y/MM/d');
    for (Map workshop in widget.upcomingWorkshop) {
      if (form.format(now.toDate()) == form.format(workshop['date'].toDate()))
        todayWorkshop.add(workshop);
      else
        upComingWorkshop.add(workshop);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.all(0),
                    content: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          top: -50,
                          left: ScreenUtil().setWidth(260),
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                            width: ScreenUtil().setWidth(320),
                            height: ScreenUtil().setHeight(600),
                            // decoration: new BoxDecoration(
                            //     color: Color(0xffffffff),
                            //     borderRadius: BorderRadius.circular(12),
                            //     boxShadow: [BoxShadow(
                            //         color: Color(0x26454545),
                            //         offset: Offset(0,5),
                            //         blurRadius: 6,
                            //         spreadRadius: 0
                            //     ) ],
                            //   ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      uploadImage();
                                    },
                                    child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: ScreenUtil().setWidth(8),
                                            horizontal:
                                                ScreenUtil().setHeight(8)),
                                        width: ScreenUtil().setWidth(304),
                                        height: ScreenUtil().setHeight(159),
                                        child: Image.asset(
                                            "assets/images/addimage_card.png")),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10),
                                          top: ScreenUtil().setHeight(12)),
                                      width: ScreenUtil().setWidth(293),
                                      height: ScreenUtil().setHeight(40),
                                      padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(18)),
                                      decoration: new BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x1a777777),
                                              offset: Offset(0, 2),
                                              blurRadius: 3,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: TextField(
                                          controller: workshopName,
                                          decoration: InputDecoration(
                                            hintText: 'Workshop\'s name',
                                            // contentPadding: EdgeInsets.only(
                                            //     left: 14, top: 18, bottom: 18),
                                            hintStyle: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xffbbbbbb),
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ))),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10)),
                                      // margin:
                                      // EdgeInsets.only(left: 24, right: 24, bottom: 15),
                                      width: ScreenUtil().setWidth(293),
                                      height: ScreenUtil().setHeight(40),
                                      padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(18)),
                                      decoration: new BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x1a777777),
                                              offset: Offset(0, 2),
                                              blurRadius: 3,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: TextField(
                                          controller: speaker,
                                          decoration: InputDecoration(
                                            hintText: 'Speaker',
                                            // contentPadding: EdgeInsets.only(
                                            //     left: 14, top: 18, bottom: 18),
                                            hintStyle: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xffbbbbbb),
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ))),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10)),
                                      // margin:
                                      // EdgeInsets.only(left: 24, right: 24, bottom: 15),
                                      width: ScreenUtil().setWidth(293),
                                      height: ScreenUtil().setHeight(40),
                                      padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(18)),
                                      decoration: new BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x1a777777),
                                              offset: Offset(0, 2),
                                              blurRadius: 3,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: TextField(
                                          maxLines: 5,
                                          minLines: 1,
                                          expands: true,
                                          keyboardType: TextInputType.multiline,
                                          controller: description,
                                          decoration: InputDecoration(
                                            hintText: 'Brief description',
                                            // contentPadding: EdgeInsets.only(
                                            //     left: 14, top: 18, bottom: 18),
                                            hintStyle: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xffbbbbbb),
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ))),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10)),
                                      // margin:
                                      // EdgeInsets.only(left: 24, right: 24, bottom: 15),
                                      width: ScreenUtil().setWidth(293),
                                      height: ScreenUtil().setHeight(40),
                                      padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(18)),
                                      decoration: new BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x1a777777),
                                              offset: Offset(0, 2),
                                              blurRadius: 3,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: GestureDetector(
                                        onTap: () => _selectDate(context),
                                        child: AbsorbPointer(
                                          child: TextField(
                                              controller: date,
                                              decoration: InputDecoration(
                                                suffixIcon:
                                                    Icon(Icons.calendar_today),
                                                hintText: 'Date',
                                                // contentPadding: EdgeInsets.only(
                                                //     left: 14, top: 18, bottom: 18),
                                                hintStyle: TextStyle(
                                                  fontFamily: 'SFProDisplay',
                                                  color: Color(0xffbbbbbb),
                                                  fontSize:
                                                      ScreenUtil().setSp(15),
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                              )),
                                        ),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10)),
                                      // margin:
                                      // EdgeInsets.only(left: 24, right: 24, bottom: 15),
                                      width: ScreenUtil().setWidth(293),
                                      height: ScreenUtil().setHeight(40),
                                      padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(18)),
                                      decoration: new BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x1a777777),
                                              offset: Offset(0, 2),
                                              blurRadius: 3,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: TextField(
                                          controller: participants,
                                          decoration: InputDecoration(
                                            hintText: 'Target Participants',
                                            // contentPadding: EdgeInsets.only(
                                            //     left: 14, top: 18, bottom: 18),
                                            hintStyle: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xffbbbbbb),
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ))),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10)),
                                      // margin:
                                      // EdgeInsets.only(left: 24, right: 24, bottom: 15),
                                      width: ScreenUtil().setWidth(293),
                                      height: ScreenUtil().setHeight(40),
                                      padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(18)),
                                      decoration: new BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x1a777777),
                                              offset: Offset(0, 2),
                                              blurRadius: 3,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: TextField(
                                          controller: linkToJoin,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Link to join/register workshop',
                                            // contentPadding: EdgeInsets.only(
                                            //     left: 14, top: 18, bottom: 18),
                                            hintStyle: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xffbbbbbb),
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ))),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: ScreenUtil().setHeight(10)),
                                      // margin:
                                      // EdgeInsets.only(left: 24, right: 24, bottom: 15),
                                      width: ScreenUtil().setWidth(293),
                                      height: ScreenUtil().setHeight(40),
                                      padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(18)),
                                      decoration: new BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x1a777777),
                                              offset: Offset(0, 2),
                                              blurRadius: 3,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: TextField(
                                          controller: contactInfo,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Organizer\'s Contact (Link)',
                                            // contentPadding: EdgeInsets.only(
                                            //     left: 14, top: 18, bottom: 18),
                                            hintStyle: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              color: Color(0xffbbbbbb),
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ))),
                                  Container(
                                      margin: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(5),
                                      ),
                                      width: ScreenUtil().setWidth(178),
                                      height: ScreenUtil().setHeight(40),
                                      child: RaisedButton(
                                          onPressed: () {
                                            submit();
                                          },
                                          color: Color(0xffffbf2f),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text("Upload workshop",
                                              style: TextStyle(
                                                fontFamily: 'SFProDisplay',
                                                color: Color(0xffffffff),
                                                fontSize: ScreenUtil().setSp(18,
                                                    allowFontScalingSelf:
                                                        false),
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                              ))))
                                ],
                              ),
                            )),
                      ],
                    ),
                    actions: [],
                  );
                },
              );
            },
            child: Container(
              width: ScreenUtil().setWidth(126),
              height: ScreenUtil().setHeight(30),
              decoration: new BoxDecoration(
                  color: Color(0xffffbf2f),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(24),
                  top: ScreenUtil().setHeight(20)),
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text("Add workshop",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff000000),
                        fontSize:
                            ScreenUtil().setSp(13, allowFontScalingSelf: false),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ))
                ],
              ),
            ),
          ),
          todayWorkshop.length > 0
              ? Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(16),
                        bottom: ScreenUtil().setHeight(12)),
                    width: ScreenUtil().setWidth(312),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff000000),
                              fontSize: ScreenUtil()
                                  .setSp(14, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            )),
                        // Text("See all (3)",
                        //     style: TextStyle(
                        //       fontFamily: 'SFProDisplay',
                        //       color: Color(0xffffbf2f),
                        //       fontSize:
                        //           ScreenUtil().setSp(14, allowFontScalingSelf: true),
                        //       fontWeight: FontWeight.w400,
                        //       fontStyle: FontStyle.normal,
                        //     )),
                      ],
                    ),
                  ),
                )
              : Container(),
          todayWorkshop.length > 0 ? SliderCard(todayWorkshop) : Container(),
          upComingWorkshop.length > 0
              ? Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(20),
                        bottom: ScreenUtil().setHeight(12)),
                    width: ScreenUtil().setWidth(312),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Upcoming",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff000000),
                              fontSize: ScreenUtil()
                                  .setSp(14, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            )),
                        // Text("See all (3)",
                        //     style: TextStyle(
                        //       fontFamily: 'SFProDisplay',
                        //       color: Color(0xffffbf2f),
                        //       fontSize:
                        //           ScreenUtil().setSp(14, allowFontScalingSelf: true),
                        //       fontWeight: FontWeight.w400,
                        //       fontStyle: FontStyle.normal,
                        //     )),
                      ],
                    ),
                  ),
                )
              : Container(),
          upComingWorkshop.length > 0
              ? SliderCard(upComingWorkshop)
              : Container(),

          // Container(
          //   margin: EdgeInsets.only(left: 24,right:24, bottom: 17,top:20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text("Recommended for you",
          //           style: TextStyle(
          //             fontFamily: 'SFProDisplay',
          //             color: Color(0xff000000),
          //             fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
          //             fontWeight: FontWeight.w600,
          //             fontStyle: FontStyle.normal,
          //           )
          //       ),
          //       Text("See all (3)",
          //           style: TextStyle(
          //             fontFamily: 'SFProDisplay',
          //             color: Color(0xffffbf2f),
          //             fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
          //             fontWeight: FontWeight.w400,
          //             fontStyle: FontStyle.normal,

          //           )
          //       ),
          //     ],
          //   ),
          // ),
          // SliderCard(workshopList),

          // GridView.count(
          //   childAspectRatio:itemHeight/itemWidth,
          //     shrinkWrap: true,
          //     scrollDirection: Axis.vertical,
          //     crossAxisCount: 2,
          //   // crossAxisSpacing: 10,
          //   // mainAxisSpacing: 10,
          //   // padding: EdgeInsets.all(10),
          //   children:
          //   List.generate(workshops.length, (index) {
          //     return Container(
          //       child: WorkshopCard(
          //           workshops[index]['image_source'],
          //           workshops[index]['link'],
          //           workshops[index]['title'],
          //           workshops[index]['date'],
          //           workshops[index]['speaker']),
          //     );
          //   } ),
          // ),
          // Container(
          //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          //     child: Text(
          //       "Most popular workshops",
          //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          //     )),
          // SliderCard(),
          // // GridView.count(
          // //   childAspectRatio:itemHeight/itemWidth,
          // //   shrinkWrap: true,
          // //   scrollDirection: Axis.vertical,
          // //   crossAxisCount: 2,
          // //   // crossAxisSpacing: 10,
          // //   // mainAxisSpacing: 10,
          // //   // padding: EdgeInsets.all(10),
          // //   children:
          // //   List.generate(workshops.length, (index) {
          // //     return Container(
          // //       child: WorkshopCard(
          // //           workshops[index]['image_source'],
          // //           workshops[index]['link'],
          // //           workshops[index]['title'],
          // //           workshops[index]['date'],
          // //           workshops[index]['speaker']),
          // //     );
          // //   } ),
          // // ),
        ],
      ),
    );
  }
}
