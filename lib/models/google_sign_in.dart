import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;
  GoogleSignInProvider() {
    _isSigningIn = false;
  }
  bool get isSigningIn => _isSigningIn;
  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future signInWithGoogle() async {
    isSigningIn = true;
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      isSigningIn = false;
      return;
    } else {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      isSigningIn = false;
    }

    // Obtain the auth details from the request

    // Create a new credential

    // Once signed in, return the UserCredential
    // return
  }

  void logout() async {
    if (FirebaseAuth.instance.currentUser.providerData[0].providerId ==
        'google.com') {
      await googleSignIn.disconnect();
    }
    FirebaseAuth.instance.signOut();
  }
}
