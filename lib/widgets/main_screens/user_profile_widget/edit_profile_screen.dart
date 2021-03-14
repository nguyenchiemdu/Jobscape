import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:learning_app/models/users_database.dart';
import 'package:learning_app/widgets/login_screens/warning.dart';
import 'package:learning_app/widgets/main_screens/learning_widget/submit_widget.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/avatar_edit_profile_widget.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/course_completed_widget.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/journey_completed_widget.dart';
import 'package:learning_app/widgets/main_screens/user_profile_widget/user_profile_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class EditUserProfile extends StatefulWidget {
  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  TextEditingController nameController = TextEditingController()..text = '';

  TextEditingController emailController = TextEditingController()..text = '';

  TextEditingController positionController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController experienceController = TextEditingController();

  TextEditingController companyController = TextEditingController();
  Map userInfor;
  PickedFile image;
  PickedFile avatar;
  void changeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserProfileWidget()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    userInfor = await UserDatabaseService().getUserInfor();
    setState(() {
      nameController = TextEditingController()..text = userInfor['displayName'];
      emailController = TextEditingController()..text = userInfor['email'];
      positionController = TextEditingController()
        ..text = userInfor['currentPosition'];
      ageController = TextEditingController()..text = userInfor['age'];
      experienceController = TextEditingController()
        ..text = userInfor['yearExperience'];
      companyController = TextEditingController()..text = userInfor['company'];
      emailController = TextEditingController()..text = userInfor['email'];
    });
  }

  uploadProfile() async {
    Map<String, dynamic> newInfor = {};
    newInfor['displayName'] = nameController.text;
    newInfor['currentPosition'] = positionController.text;
    newInfor['age'] = ageController.text;
    newInfor['yearExperience'] = experienceController.text;
    newInfor['company'] = companyController.text;
    newInfor['email'] = emailController.text;
    await UserDatabaseService().uploadProfile(newInfor);
  }

  submitCV() async {
    final _storage = FirebaseStorage.instance;
    String uid = FirebaseAuth.instance.currentUser.uid;

    if (image != null) {
      var file = File(image.path);
      //upload to FireBase
      var _snapshot = await _storage
          .ref()
          .child('CV/$uid')
          .putFile(file)
          .whenComplete(() => print('Upload CV  to Storage complete'))
          .onError((error, stackTrace) {
        print('Failed to upload CV to storage:' + error);
        return null;
      });
    } else {
      print('No Path received');
    }
  }

  submitAvatar() async {
    final _storage = FirebaseStorage.instance;
    String uid = FirebaseAuth.instance.currentUser.uid;

    if (avatar != null) {
      var file = File(avatar.path);
      //upload to FireBase
      var _snapshot = await _storage
          .ref()
          .child('avatar/$uid')
          .putFile(file)
          .whenComplete(() => print('Upload avatar  to Storage complete'))
          .onError((error, stackTrace) {
        print('Failed to upload avatar to storage:' + error);
        return null;
      });
      var downloadURLs = await _snapshot.ref.getDownloadURL();
      await UserDatabaseService().updateUserPhotoURL(downloadURLs);
    } else {
      print('No Path to avatar received');
    }
  }

  chooseCV() async {
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

  chooseAvatar() async {
    final _picker = ImagePicker();

    //CHeck permission
    // await Permission.photos.request();
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //Select Image
      PickedFile result = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        avatar = result;
      });
    } else {
      print('Grand permissions and try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [
        avatar == null
            ? AvatarEditProfileWidget()
            : new Image.asset(avatar.path),
        Container(
          width: ScreenUtil().setWidth(360),
          height: ScreenUtil().setHeight(760),
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_user_profile.png"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstOver)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(24),
                      top: ScreenUtil().setHeight(220),
                      bottom: ScreenUtil().setHeight(36)),
                  child: Text("Edit Profile",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff000000),
                        fontSize:
                            ScreenUtil().setSp(20, allowFontScalingSelf: false),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Center(
                  child: Container(
                      // margin:
                      // EdgeInsets.only(left: 24, right: 24, bottom: 15),
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(40),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffffefcc)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a777777),
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          // controller: password,
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Your Name',
                            // contentPadding: EdgeInsets.only(
                            //     left: 14, top: 18, bottom: 18),
                            hintStyle: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff303030),
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ))),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(10),
                      left: ScreenUtil().setWidth(24),
                      right: ScreenUtil().setWidth(24)),
                  child: Row(
                    children: [
                      Container(
                          margin:
                              EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                          width: ScreenUtil().setWidth(248),
                          height: ScreenUtil().setHeight(40),
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffffefcc)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x1a777777),
                                  offset: Offset(0, 2),
                                  blurRadius: 3,
                                  spreadRadius: 0)
                            ],
                          ),
                          child: TextField(
                              controller: positionController,
                              decoration: InputDecoration(
                                hintText: 'Current Position',
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
                          width: ScreenUtil().setWidth(54),
                          height: ScreenUtil().setHeight(40),
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setWidth(15)),
                          decoration: new BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffffefcc)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x1a777777),
                                  offset: Offset(0, 2),
                                  blurRadius: 3,
                                  spreadRadius: 0)
                            ],
                          ),
                          child: TextField(
                              controller: ageController,
                              decoration: InputDecoration(
                                hintText: 'Age',
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
                    ],
                  ),
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(40),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffffefcc)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a777777),
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          controller: experienceController,
                          decoration: InputDecoration(
                            hintText:
                                'Years of experience (Fresher/Junior/Senior)',
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
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(40),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffffefcc)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a777777),
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          controller: companyController,
                          decoration: InputDecoration(
                            hintText: 'Your company',
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
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(40),
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(18)),
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffffefcc)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a777777),
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              spreadRadius: 0)
                        ],
                      ),
                      child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            // contentPadding: EdgeInsets.only(
                            //     left: 14, top: 18, bottom: 18),
                            hintStyle: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff303030),
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ))),
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(130),
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
                                    image: AssetImage(
                                        "assets/images/image_upload.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              image == null
                                  ? Container()
                                  : Text("..." +
                                      image.path.substring(
                                          image.path.length - 20,
                                          image.path.length)),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(4),
                                  ),
                                  width: ScreenUtil().setWidth(120),
                                  height: ScreenUtil().setHeight(28),
                                  child: RaisedButton(
                                      onPressed: () {
                                        chooseCV();
                                      },
                                      color: Color(0xffffbf2f),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text("Upload CV",
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            color: Color(0xffffffff),
                                            fontSize: ScreenUtil().setSp(15),
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )))),
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
                            uploadProfile();
                            submitCV();
                            submitAvatar();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AdvanceCustomAlert("Success","Profile changes saved successfully!");

                                });
                          },
                          color: Color(0xffffbf2f),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text("Save Profile",
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
        ),
        Container(
          margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(50), left: ScreenUtil().setWidth(24)),
          child: ClipOval(
            child: Material(
              color: Colors.white, // button color
              child: InkWell(
                splashColor: Color(0xffffbf2f), // inkwell color
                child: SizedBox(
                    width: 36, height: 36, child: Icon(Icons.arrow_back)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        Positioned(
          left: ScreenUtil().setWidth(110),
          top: ScreenUtil().setHeight(60),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  chooseAvatar();
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(8)),
                  width: ScreenUtil().setWidth(46),
                  height: ScreenUtil().setHeight(46),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/add_icon.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Text("Add new avatar",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xffffffff),
                    fontSize:
                        ScreenUtil().setSp(20, allowFontScalingSelf: false),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
