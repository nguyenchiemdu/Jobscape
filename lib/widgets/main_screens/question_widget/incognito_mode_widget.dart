import 'package:flutter/material.dart';

class IncognitoModeWidget extends StatefulWidget {
  final bool status;
  IncognitoModeWidget(this.status);
  @override
  _IncognitoModeWidgetState createState() =>
      _IncognitoModeWidgetState(this.status);
}

class _IncognitoModeWidgetState extends State<IncognitoModeWidget> {
  bool status;
  _IncognitoModeWidgetState(this.status);
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: status,
      onChanged: (value) {
        setState(() {
          status = !status;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }
}
