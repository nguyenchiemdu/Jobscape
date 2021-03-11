import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/models/google_sign_in.dart';

import 'package:provider/provider.dart';
import './widgets/login_screens/login_screen.dart';
import './widgets/main_screens/main_screen.dart';
import 'package:learning_app/models/users_database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
    });
  }

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
          return ScreenUtilInit(
            designSize: Size(360, 760),
            builder: () => MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.yellow,
                  accentColor: Colors.red,
                  fontFamily: 'SFProDisplay',
                ),
                title: 'Learning App',
                home: RoutePage()),
          );
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
// Future<int> getEnrolledCourse() async {
//
//   return enrolled_course;
// }

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      fetDatabaseList();
    });
  }

  int enrolled_course = 0;
  fetDatabaseList() async {
    dynamic resultant = await UserDatabaseService()
        .getUserEnrolledCourse(FirebaseAuth.instance.currentUser.uid);
    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        enrolled_course = resultant;
      });
    }
  }

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
            if (enrolled_course == null) {
              return Text("Loading");
            } else {
              return enrolled_course == 0 ? LoggedInWidget() : LoggedInWidget();
            }
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
