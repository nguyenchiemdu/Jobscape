import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterForm extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();
  void createUser() async{
    try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: username.text,
    password: password.text
  );
} on FirebaseAuthException catch (e) {
  print('Failed with error code: ${e.code}');
  print(e.message);
} 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children : [
            Row(
              mainAxisAlignment: MainAxisAlignment.end ,
              children: [
                Text('English'),
                Icon(Icons.arrow_drop_down)
              ]
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(top : 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('START FOR FREE',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Sign up to Learning App.',
                    style: TextStyle(
                      fontSize: 30, 
                      fontWeight: FontWeight.bold  
                    )
                  ),
                  Row(
                    children: [
                      Text('Already has account?',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                      ),
                      FlatButton(onPressed: (){Navigator.pop(context);}, child: Text('Log in'),textColor: Colors.blue,),
                    ],
                  ),
                  Text('E-mail'),
                  TextField(controller: username,),
                  Text('Password'),
                  TextField(controller: password,),
                  RaisedButton(onPressed: createUser,child: Text('Create an account',),color: Colors.blue,textColor: Colors.white,),
                  
                ],
              ),
            )
          ]
        )
      ),
    );
  }
}