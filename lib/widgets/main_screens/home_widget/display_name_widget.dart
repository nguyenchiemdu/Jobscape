import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/users_database.dart';

class DisplayName extends StatefulWidget {
  final String title;
  final TextStyle style;
  DisplayName({this.title='',this.style});
  @override
  _DisplayNameState createState() => _DisplayNameState();
}

class _DisplayNameState extends State<DisplayName> {
  String displayName = '';
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      getData();
    }
  getData()async{
    String res =  await UserDatabaseService().getUserDisplayname();
    setState(() {
          displayName = res;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Text(widget.title+displayName,style: widget.style);
  }
}