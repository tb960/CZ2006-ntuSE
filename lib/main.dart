import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'signUp.dart';
import 'advancedSearch/advancedSearch.dart';
import 'searchLandingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/login': (context) => LoginScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/searchLanding':(context) => SearchLandingScreen(),
        '/advancedSearch': (context) => AdvancedSearchScreen(),
      },
    );
  }
}
