import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:learning_app/models/workshop_database.dart';
import 'package:learning_app/widgets/main_screens/home_widget/workshop_database.dart';
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

  Future<PickedFile> uploadImage() async {
    final _picker = ImagePicker();

    //CHeck permission
    // await Permission.photos.request();
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //Select Image
      PickedFile res = await _picker.getImage(source: ImageSource.gallery);
      return res;
    } else {
      print('Grand permissions and try again');
      return null;
    }
  }

  List todayWorkshop = [];
  List upComingWorkshop = [];
  @override
  void initState() {
    super.initState();
    // readExcel();
  }

  void readExcel() async {
    var file = "/Users/dunguyenchiem/workshop.xlsx";
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    Map<String, dynamic> workshop;
    // for (var table in excel.tables.keys) {
    //   print(table); //sheet Name
    //   print(excel.tables[table].maxCols);
    //   print(excel.tables[table].maxRows);
    // for (var row in excel.tables[sheetName].rows) {
    //   print("$row");
    // }
    // }
    String sheetName = 'Sheet1';
    print(excel.tables[sheetName].rows[16][1]);
    for (int i = 16; i < excel.tables[sheetName].rows.length; i++) {
      workshop = {
        "date": "ahihi",
        "speaker": "Intel Developer Zone",
        "for": "Machine Learning Engineer",
        "link":
            "https://www.facebook.com/events/1517194498479958/?acontext=%7B%22event_action_history%22%3A[%7B%22mechanism%22%3A%22search_results%22%2C%22surface%22%3A%22search%22%7D]%7D",
        "description": "",
        "title": "Webinar: Edge AI Reference Applications",
        "image_source":
            "https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/WorkshopImg%2Fai2_800x450.jpg?alt=media&token=327d5063-7feb-4bd7-b118-c0d243c08e45",
        "status": true,
        "organizationContact": "https://www.facebook.com/IntelDeveloperZone/",
      };

      // workshop['date'] = excel.tables[sheetName].rows[i][0];
      workshop['date'] = DateTime(1899, 12, 30)
          .add(Duration(days: excel.tables[sheetName].rows[i][0]));
      workshop['date'] = Timestamp.fromDate(workshop['date']);
      workshop['title'] = excel.tables[sheetName].rows[i][1];
      workshop['description'] = excel.tables[sheetName].rows[i][2];
      workshop['for'] = excel.tables[sheetName].rows[i][3];
      workshop['image_source'] = excel.tables[sheetName].rows[i][4];
      workshop['link'] = excel.tables[sheetName].rows[i][5];
      workshop['organizationContact'] = excel.tables[sheetName].rows[i][6];
      workshop['speaker'] = excel.tables[sheetName].rows[i][7];
      workshop['type'] = 'new';
      // if (workshop['review'] == null) workshop['review'] == 0;
      // workshop['level'] =
      //     excel.tables[sheetName].rows[i][4].toString()[0].toUpperCase() +
      //         excel.tables[sheetName].rows[i][4].toString().substring(1);
      // workshop['price'] =
      //     double.tryParse(excel.tables[sheetName].rows[i][5].toString());
      // if (workshop['price'] == null) workshop['price'] = 0;
      // if (excel.tables[sheetName].rows[i][5].toString() == 'subcription' ||
      //     excel.tables[sheetName].rows[i][5].toString() == 'Subcription')
      //   workshop['price'] = 'Subcription';
      // workshop['link'] = excel.tables[sheetName].rows[i][6];
      // print(DateFormat('MM/dd/yyy').format(workshop['date'].toDate()));
      print(workshop);
      await WorkshopDatabase().AddWorkshop(workshop);
      //await DatabaseManager().addworkshop(workshop, path: widget.skillItem['path']);
    }
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
                  PickedFile img;
                  return StatefulBuilder(builder: (context, setState) {
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
                                      onTap: () async {
                                        PickedFile res = await uploadImage();

                                        image = res;
                                        setState(() {
                                          img = res;
                                          if (res != null) print(image.path);
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenUtil().setWidth(8),
                                              horizontal:
                                                  ScreenUtil().setHeight(8)),
                                          width: ScreenUtil().setWidth(304),
                                          height: ScreenUtil().setHeight(159),
                                          child: img == null
                                              ? Image.asset(
                                                  "assets/images/addimage_card.png")
                                              : Image.file(File(image.path))),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                fontSize:
                                                    ScreenUtil().setSp(15),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                fontSize:
                                                    ScreenUtil().setSp(15),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0x1a777777),
                                                offset: Offset(0, 2),
                                                blurRadius: 3,
                                                spreadRadius: 0)
                                          ],
                                        ),
                                        child: TextField(
                                            controller: description,
                                            decoration: InputDecoration(
                                              hintText: 'Brief description',
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                  suffixIcon: Icon(
                                                      Icons.calendar_today),
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
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                fontSize:
                                                    ScreenUtil().setSp(15),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                fontSize:
                                                    ScreenUtil().setSp(15),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                fontSize:
                                                    ScreenUtil().setSp(15),
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
                                                  fontSize: ScreenUtil().setSp(
                                                      18,
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
                  });
                },
              );
              //print('thuc hien lend doc data o day');
            },
            child: Container(
              width: ScreenUtil().setWidth(135),
              height: ScreenUtil().setHeight(30),
              decoration: new BoxDecoration(
                  color: Color(0xffffbf2f),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(24),
                  top: ScreenUtil().setHeight(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.add),
                  Text("Share a workshop",
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
