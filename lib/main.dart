import 'package:flutter/material.dart';
import 'package:secondproject/pages/home.dart';
import 'package:secondproject/pages/Loading.dart';
import 'package:secondproject/pages/choose_location.dart';
void main() => runApp(MaterialApp(
initialRoute: '/',
  routes:{
    '/': (context) =>Loading(),
    '/home': (context) =>Home(),
    '/location': (context) => ChooseLocation()
  }


));


