import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holocaust_ish_shalom/screens/phone/main_screen_phone.dart';
import 'package:holocaust_ish_shalom/widgets/switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'יום השואה הבין לאומי איש שלום',
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xffd8aa2f),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: GoogleFonts.bellefair(
              fontSize: 97,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5,
              color: Colors.white,
            ),
            headline2: GoogleFonts.bellefair(
              fontSize: 61,
              fontWeight: FontWeight.w300,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
            headline3: GoogleFonts.bellefair(
              fontSize: 48,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            headline4: GoogleFonts.bellefair(
              fontSize: 34,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
              color: Colors.white,
            ),
            headline5: GoogleFonts.bellefair(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            headline6: GoogleFonts.bellefair(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              color: Colors.white,
            ),
            subtitle1: GoogleFonts.bellefair(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15,
              color: Colors.white,
            ),
            subtitle2: GoogleFonts.bellefair(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1,
              color: Colors.white,
            ),
            bodyText1: GoogleFonts.bellefair(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
            bodyText2: GoogleFonts.bellefair(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
              color: Colors.white,
            ),
            button: GoogleFonts.bellefair(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25,
              color: Colors.white,
            ),
            caption: GoogleFonts.bellefair(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4,
              color: Colors.white,
            ),
            overline: GoogleFonts.bellefair(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          )),
      home: const Switcher(
        phone: MainScreenPhone(),
        pc: Text("Web"),
      ),
    );
  }
}
