import 'package:flutter/material.dart';
import 'package:world_location/pages/choose_location.dart';
import 'package:world_location/pages/home.dart';
import 'package:world_location/pages/loading.dart';
import 'package:http/http.dart';



void main() {
  runApp(MaterialApp(
    initialRoute: '/',
   // home:Home(),
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),

    },
  ));
}