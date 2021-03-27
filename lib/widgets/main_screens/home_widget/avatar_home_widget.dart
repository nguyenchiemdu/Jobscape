import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/users_database.dart';

class AvatarHomeWidget extends StatefulWidget {
  @override
  int size;
  AvatarHomeWidget(this.size);
  _AvatarHomeWidgetState createState() => _AvatarHomeWidgetState();
}

class _AvatarHomeWidgetState extends State<AvatarHomeWidget> {
  String url =
      'https://firebasestorage.googleapis.com/v0/b/fir-ce454.appspot.com/o/avatar%2Fdefault-avatar.png?alt=media&token=96da3222-7de1-4b6e-b825-a4a5a309a97a';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getURL();
  }

  getURL() async {
    String res = await UserDatabaseService().getUserphotoURL();
    setState(() {
      url = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(12)),
      width: ScreenUtil().setWidth(widget.size),
      height: ScreenUtil().setWidth(widget.size),
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: CachedNetworkImageProvider(url),
            fit: BoxFit.fitWidth,
          )),
    );
  }
}
