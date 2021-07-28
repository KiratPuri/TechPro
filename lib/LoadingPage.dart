import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'Bloc/AuthBloc.dart';
import 'Presentation.dart';
import 'main.dart';
import 'package:techpro/Login.dart';

class DelayScreen extends StatefulWidget {
  @override
  _DelayScreenState createState() => _DelayScreenState();
}

class _DelayScreenState extends State<DelayScreen> {
  late StreamSubscription<User?> loginStateSubscription;
  List<Map> sorted = [];
  late String url;

  Future server() async{
    Firebase.initializeApp();
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((User) {
      if (User != null) {
        Future.delayed(Duration(seconds: 2)).then((value) {
          Navigator.pushReplacementNamed(context, '/Presentation');
        });
      }
      else{
        Future.delayed(Duration(seconds: 2)).then((value) {
          Navigator.pushReplacementNamed(context, '/login');
        });
      }
    });
  }

  @override
  void initState() {
    Firebase.initializeApp();
    server();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset('assets/loader.gif'),
        )));
  }
}