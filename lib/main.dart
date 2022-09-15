import 'package:flutter/material.dart';
import 'package:intro_screen_app/screens/home_page.dart';
import 'package:intro_screen_app/screens/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isIntroVisited = prefs.getBool('isIntroVisited') ?? false;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Intro_page',
      // initialRoute: (isIntroVisited == false) ? 'Intro_page' : '/',
      routes: {
        '/': (context) => const HomePage(),
        'Intro_page': (context) => const IntroPage(),
      },
    ),
  );
}
