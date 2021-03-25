import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'src/src.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColor.backgroundColor,
      ),
      home: WelcomeScreen(),
    );
  }
}
