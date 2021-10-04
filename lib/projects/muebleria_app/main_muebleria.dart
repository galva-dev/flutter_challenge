import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/muebleria_app/constants.dart';
import 'package:flutter_challenge/projects/muebleria_app/screens/home/home_screen_muebleria.dart';
import 'package:google_fonts/google_fonts.dart';

class MuebleriaApp extends StatefulWidget {
  const MuebleriaApp({ Key? key }) : super(key: key);

  @override
  _MuebleriaAppState createState() => _MuebleriaAppState();
}

class _MuebleriaAppState extends State<MuebleriaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muebleria App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.dmSansTextTheme().apply(
          displayColor: kTextColor,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreenMuebleria(),
    );
  }
}