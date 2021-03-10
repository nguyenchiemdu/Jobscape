import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/users_database.dart';
class AvatarEditProfileWidget extends StatefulWidget {
  @override
  _AvatarEditProfileWidgetState createState() => _AvatarEditProfileWidgetState();
}

class _AvatarEditProfileWidgetState extends State<AvatarEditProfileWidget> {
  String url = 'https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/avatar%2Fdefault-avatar.png?alt=media&token=96da3222-7de1-4b6e-b825-a4a5a309a97a';
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      getURL();
    }
  getURL()async{
    String res = await UserDatabaseService().getUserbackgroundURL();
    setState(() {
          url = res;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(259),
              decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        url),
                    fit: BoxFit.fill,
                  )),
            );
  }
}