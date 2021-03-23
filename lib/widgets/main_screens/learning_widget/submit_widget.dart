import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:learning_app/widgets/login_screens/warning.dart';
// import 'package:learning_app/models/firebase_storage.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/learning_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class Submit extends StatefulWidget {
  final List<Map> listSkill;
  List<String> listNameSkill;
  Submit(this.listSkill){
listNameSkill =
        listSkill.map((e) => e['name'].toString()).toList();
  }
  @override
  _SubmitState createState() => _SubmitState(listNameSkill);
}

class _SubmitState extends State<Submit> {
  List<String> _locations;
  String _selectedLocation;
  _SubmitState(this._locations);
  PickedFile image;
  submit(BuildContext ctx) async{
      textRecognition();
      final _storage = FirebaseStorage.instance;
      String uid =FirebaseAuth.instance.currentUser.uid;
      
      if (image != null && _selectedLocation != null) {
        var file = File(image.path);
        //upload to FireBase
        var _snapshot = await _storage
            .ref()
            .child('listProof/$_selectedLocation/$uid')
            .putFile(file)
            .whenComplete(() => print('Upload Proof  to Storage complete'))
            .onError((error, stackTrace) {
          print('Failed to upload Image:' + error);
          return null;
        });
        var downloadURLs = await _snapshot.ref.getDownloadURL();
        int index = _locations.indexOf(_selectedLocation);
        if (index ==-1) {
          print('please choose the skill!');
          Scaffold.of(ctx).showSnackBar(SnackBar(content: Text('Please chooose the skill!')));
        }
        else
        {
          
          //upload to Firestore
          await UserDatabaseService().submitProof(fullPath: widget.listSkill[index]['path'],cate: widget.listSkill[index]['category'],skillName: _selectedLocation,proofURL: downloadURLs )
          .then((value){
            showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AdvanceCustomAlert("Success","Successfully upload your proof.!");
                            })
            .then((_){
               setState(() {
                          _selectedLocation = null;
                          image = null;
                          }
              );
            });
              
          })
          .onError((error, stackTrace){
            showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AdvanceCustomAlert("Failed",error.toString());
                            });
          });
        }
        
        

      } else {
        String infor = 'No path received or no skill name received';
        print(infor);
        Scaffold.of(ctx).showSnackBar(SnackBar(content: Text(infor)));
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
      PickedFile res = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
              image = res;
            });
      
    } else {
      print('Grand permissions and try again');
    }
  }
  void textRecognition()async{
    final visionImage = FirebaseVisionImage.fromFile(File(image.path));
    final textRecognizer = FirebaseVision.instance.textRecognizer();
    final visionText = await  textRecognizer.processImage(visionImage);
    await textRecognizer.close();
    final text = extractText(visionText);
    print(text.toString());

  }
  static extractText(VisionText visionText){
    String text = '';
    for (TextBlock block in visionText.blocks){
      for (TextLine line in block.lines){
        for (TextElement word in line.elements){
          text = text+ word.text+ '';
        }
        text = text+'\n';
      }
    }
    return text;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Submit your proof",
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xff000000),
                  fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: false),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("File format: Image or Document (.img, .png, .pdf.)",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("Size: maximum 2 MB",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("Standard processing time: 72 hours",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(14)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right:ScreenUtil().setWidth(7), top: ScreenUtil().setHeight(4)),
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setHeight(6),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffbf2f)
                      )
                  ),
                  Container(
                    width: ScreenUtil().setWidth(294),
                    child: new Text("After your proof is validated by admin, your next skill(s) will be unlocked.",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff454545),
                          fontSize: ScreenUtil().setSp(13,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  )
                ],),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(15),
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
                          fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    // Not necessary for Option 1
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                      });
                    },

                    items: _locations.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location,
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff000000),
                              fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false),
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
                  padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
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
                                        fontSize: ScreenUtil().setSp(15,allowFontScalingSelf: false),
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
                                  fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: false),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: ScreenUtil().setHeight(1)),
                            child: Text(
                                image == null 
                                ? "(Drag and drop files here, or browse your phone)"
                                : image.path.substring(image.path.length-20, image.path.length),
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xff888888),
                                  fontSize: ScreenUtil().setSp(11,allowFontScalingSelf: false),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                )),
                          ),

                        ],
                      ),
                    ),
                  )),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(25),
                  ),
                  width: ScreenUtil().setWidth(312),
                  height: ScreenUtil().setHeight(44),
                  child: RaisedButton(
                      onPressed: () {
                        submit(context);
                      },
                      color: Color(0xffffbf2f),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("Submit",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xffffffff),
                            fontSize: ScreenUtil()
                                .setSp(18, allowFontScalingSelf: false),
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )))),
            ),
          ],
        ),
      ),
    );
  }
}
