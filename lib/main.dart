import 'package:chesstimer/screens/HomeScreen.dart';
import 'package:chesstimer/screens/TimerScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.jockeyOneTextTheme(),
      ),
      home: HomeScreen(

      )

      ,
    );
  }
}
