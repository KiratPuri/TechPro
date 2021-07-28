import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techpro/Bloc/Bolc.dart';
import 'package:techpro/Login.dart';
import 'Bloc/AuthBloc.dart';
import 'Bloc/Event.dart';
import 'Bloc/State.dart';
import 'Data/Repo.dart';
import 'LoadingPage.dart';
import 'Presentation.dart';
import 'dart:async';
import 'package:provider/provider.dart';

late double width;
late double height;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {
        Firebase.initializeApp();
        return AuthBloc();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        routes: {
          '/delay': (context) => DelayScreen(),
          '/login': (context) => LoginScreen(),
          '/Presentation': (context) => BlocProvider(
              lazy: false,
              create: (context) {
                return  CoursesBloc(repository: RepositoryImpl());
              },
              child: Presentation()),
        },
        home: DelayScreen(),
      ),
    );
  }
}
