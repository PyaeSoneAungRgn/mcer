import 'package:flutter/material.dart';
import 'package:mcer/screens/about.dart';
import 'package:mcer/screens/credit.dart';
import 'package:mcer/screens/home.dart';
import 'package:mcer/screens/web_view.dart';

class Routes {
  Routes() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MCER',
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/credit': (context) => Credit(),
        '/web_view': (context) => WebView(),
        '/about': (context) => About(),
      },
    ));
  }
}
