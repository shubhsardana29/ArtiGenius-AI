import 'package:artigeniusai/colors.dart';
import 'package:artigeniusai/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // User canceled sign-in

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      if (user != null) {
        // User signed in successfully.
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      // Handle sign-in errors, e.g., display an error message.
      print('Error signing in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your beautiful UI elements here
            // ...
            Image.asset("assets/images/logo3.png"),
            const SizedBox(height: 20),
            Text(
              'Artigenius AI',
              style: TextStyle(
                fontSize: 30,
                fontFamily: "poppins_bold",
                color: whiteColor,
              ),
            ),
            const SizedBox(height: 20),

            // Google Sign-In Button
            ElevatedButton.icon(
                onPressed: () => _signInWithGoogle(context),
                icon: Icon(Icons.login),
                label: Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: btnColor,
                  onPrimary: whiteColor,
                  minimumSize: Size(300, 50),
                )),
          ],
        ),
      ),
    );
  }
}
