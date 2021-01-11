import 'package:clocky/pages/choose_location.dart';
import 'package:clocky/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:clocky/pages/home.dart';

void main() {
  runApp(MaterialApp(
  //  initialRoute: '/home',
    routes: {
      '/':(context) => Loading(),
      '/home': (context)=> Home(),
      '/location': (context)=>Location(),

    }
    ,

  ));
}

