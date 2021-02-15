import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:learning_app/models/google_sign_in.dart';

import 'package:provider/provider.dart';
import './widgets/LoginForm.dart';
import './widgets/logged_in_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('Some thing went wrong');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.yellow,
                accentColor: Colors.red,
                fontFamily: 'SFProDisplay',
              ),
              title: 'Learning App',
              home: MyHomePage());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(title: 'Learning App', home: LoadingPage());
      },
    );
  }
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFBF2F),
      body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: SingleChildScrollView(
              child: SafeArea(
                  child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapsot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapsot.hasData) {
                return LoggedInWidget();
              } else {
                return LoginForm();
              }
            },
          )))),
    );
  }

  Widget buildLoading() => Center(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
