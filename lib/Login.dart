import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'Bloc/AuthBloc.dart';
import 'Presentation.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                Buttons.Google,
                onPressed: () => Provider.of<AuthBloc>(context).loginGoogle(),
              ),
            ],
          ),
        ));
  }
}

/*

loginGoogle() async {
  final authService = AuthService();
  final googleSignin = GoogleSignIn(scopes: ['email']);

  try {
    final GoogleSignInAccount? googleUser = await googleSignin.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );

    //Firebase Sign in
    final result = await authService.signInWithCredential(credential);

    print('${result.user!.displayName}');

  } catch(error){
    print(error);
  }

  logout() {
    authService.logout();
  }
}

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
      _auth.signInWithCredential(credential);
  Future<void> logout() => _auth.signOut();
  Stream<User?> get currentUser => _auth.authStateChanges();
}
*/
