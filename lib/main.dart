import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:learning_app/models/google_sign_in.dart';

import 'package:provider/provider.dart';
import './widgets/login_screens/login_screen.dart';
import './widgets/main_screens/main_screen.dart';

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
              home: RoutePage());
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

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapsot) {
          final provider = Provider.of<GoogleSignInProvider>(context);
          if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapsot.hasData) {
            return LoggedInWidget();
          } else {
            return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/backgroundlogin.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: LoginForm());
          }
        },
      ),
    );
  }

  Widget buildLoading() => Scaffold(
        body: SafeArea(
          child: Center(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
}
