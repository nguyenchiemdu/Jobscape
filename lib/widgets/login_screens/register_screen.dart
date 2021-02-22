import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'register_widget.dart';
class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child:   RegisterWidget(),
    );
  }
}