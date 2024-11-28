import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splashscreen.dart';
import 'screens/homescreen.dart';
import 'screens/searchscreen.dart';
import 'screens/detailsscreen.dart';

void main() {
  runApp(AllShowsApp());
}

class AllShowsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All Shows',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF141414),
        scaffoldBackgroundColor: Color(0xFF141414),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}