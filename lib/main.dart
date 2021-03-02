import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'signUp.dart';
import 'advancedSearch.dart';

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
        '/advancedSearch': (context) => AdvancedSearchScreen(),
      },
    );
  }
}
