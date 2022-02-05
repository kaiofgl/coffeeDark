import 'package:flutter/services.dart';

import 'screens/mainPage/main_page.dart' show MainPage;
import 'package:flutter/material.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  // Api api = Api();
  // api.search("teste");

  runApp(MaterialApp(
    theme: ThemeData(
      textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black)),
    ),
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}
