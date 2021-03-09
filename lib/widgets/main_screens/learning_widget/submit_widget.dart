import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:learning_app/models/firebase_storage.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/learning_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:permission_handler/permission_handler.dart';

class Submit extends StatefulWidget {
  final List<String> listNameSkill;
  Submit(this.listNameSkill);
  @override
  _SubmitState createState() => _SubmitState(listNameSkill);
}

class _SubmitState extends State<Submit> {
  List<String> _locations;
  String _selectedLocation;
  _SubmitState(this._locations);
  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;
    //CHeck permission
    // await Permission.photos.request();
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);
      if (image != null) {
        //upload to FireBase
        var _snapshot = await _storage
            .ref()
            .child('tryimage')
            .putFile(file)
            .whenComplete(() => print('Upload Image complete'))
            .onError((error, stackTrace) {
          print('Failed to upload Image:' + error);
          return null;
        });
        var downloadURLs = await _snapshot.ref.getDownloadURL();
        print(downloadURLs);
      } else {
        print('No Path received');
      }
    } else {
      print('Grand permissions and try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Submit your proof",
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                color: Color(0xff000000),
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(7)),
                  child: Text(
                    "• ",
                    style: TextStyle(
                      color: Color(0xffffbf2f),
                      fontSize: ScreenUtil().setSp(30),
                    ),
                  ),
                ),
                Expanded(
                  child:
                      Text("File format: Image or Document (.img, .png, .pdf)",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff454545),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(7)),
                child: Text(
                  "• ",
                  style: TextStyle(
                    color: Color(0xffffbf2f),
                    fontSize: ScreenUtil().setSp(30),
                  ),
                ),
              ),
              Expanded(
                child: Text("Standard processing time: 72 hours",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff454545),
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(7)),
                child: Text(
                  "• ",
                  style: TextStyle(
                    color: Color(0xffffbf2f),
                    fontSize: ScreenUtil().setSp(30),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: ScreenUtil().setWidth(293),
                  child: Text(
                      "After your proof gets validated by admin, your next skill(s) will be unlocked.",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff454545),
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(36),
                  bottom: ScreenUtil().setHeight(16)),
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(36),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xffffbf2f)),
              ),
              padding: EdgeInsets.all(10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(12),
                  //   borderSide: BorderSide(
                  //     color: Colors.transparent,
                  //   ),
                  // ),
                  // hintText:
                  // "Select the skill",
                  // hintStyle: TextStyle(
                  //   fontFamily: 'SFProDisplay',
                  //   color: Color(0xff888888),
                  //   fontSize: ScreenUtil().setSp(14),
                  //   fontWeight: FontWeight.w300,
                  //   fontStyle: FontStyle.italic,
                  // ),

                  hint: Text('Select the skill',
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff000000),
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  // Not necessary for Option 1
                  value: _selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue;
                      print(newValue);
                    });
                  },

                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location,
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(167),
                decoration: new BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x1a000000),
                        offset: Offset(0, 3),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                ),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  strokeWidth: 1,
                  radius: Radius.circular(12),
                  dashPattern: [4, 4],
                  color: Color(0xffffbf2f),
                  child: Container(
                    width: ScreenUtil().setWidth(276),
                    height: ScreenUtil().setHeight(143),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(48),
                          height: ScreenUtil().setHeight(48),
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/image_upload.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(4),
                            ),
                            width: ScreenUtil().setWidth(120),
                            height: ScreenUtil().setHeight(28),
                            child: RaisedButton(
                                onPressed: () {
                                  uploadImage();
                                },
                                color: Color(0xffffbf2f),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text("Upload file",
                                    style: TextStyle(
                                      fontFamily: 'SFProDisplay',
                                      color: Color(0xffffffff),
                                      fontSize: ScreenUtil().setSp(15),
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )))),
                        Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(9)),
                          child: Text("Drag files here",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xffffbf2f),
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(1)),
                          child: Text(
                              "(Drag and drop files here, or browse your phone)",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff888888),
                                fontSize: ScreenUtil().setSp(11),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              )),
                        )
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
