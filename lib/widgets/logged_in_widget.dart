import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/models/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text('LoggedIn'),),
        RaisedButton(onPressed: (){
          final provider = 
              Provider.of<GoogleSignInProvider>(context,listen: false);
            provider.logout();
        },child: Text('Logg out'),)
      ],
    );
  }
}