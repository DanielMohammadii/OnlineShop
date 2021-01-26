import 'package:api_getx/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ClockApp());

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
