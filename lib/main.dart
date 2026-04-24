import 'package:flutter/material.dart';
import 'package:secondproject/pages/home.dart';
import 'package:secondproject/pages/Loading.dart';
import 'package:secondproject/pages/choose_location.dart';
import 'package:secondproject/pages/history.dart';
import 'package:secondproject/services/db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
      '/history': (context) => const HistoryPage()
    }
  ));
}
