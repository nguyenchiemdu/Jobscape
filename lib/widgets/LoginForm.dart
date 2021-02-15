import 'package:flutter/material.dart';
import 'package:learning_app/models/google_sign_in.dart';
import './RegisterForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final user = TextEditingController();
  final password = TextEditingController();
  void changeRoute(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterForm()),
    );
  }

  void signIn(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              // email: user.text, password: password.text
              email: 'admin@gmail.com',
              password: 'admin123');
    } on FirebaseAuthException catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e.code),
      ));
      print(e.code);
    }
  }

  void signInGoogle(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      margin: EdgeInsets.only(top: 300),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 250,
              // height: 50,
              child: TextField(
                  controller: user,
                  decoration: InputDecoration(
                      hintText: 'User name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))))),
          Container(
              width: 250,
              // height: 50,
              child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))))),
          FlatButton(
              textColor: Color(0xFF005DDB),
              onPressed: () {
                changeRoute(context);
              },
              child: Text('Resgister ?')),
          RaisedButton(
              color: Color(0xFF005DDB),
              onPressed: () {
                signIn(context);
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )),
          RaisedButton(
              onPressed: () {
                signInGoogle(context);
              },
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.google,
                    color: Colors.blue,
                  ),
                  Text('Sign in with Google')
                ],
              )),
        ],
      ),
    );
  }
}
