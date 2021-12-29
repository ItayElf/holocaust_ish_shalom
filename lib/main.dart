import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holocaust_ish_shalom/firebase_options.dart';
import 'package:holocaust_ish_shalom/utils.dart';
import 'package:holocaust_ish_shalom/widgets/router_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
            fontSize: convert(97),
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          headline2: GoogleFonts.bellefair(
            fontSize: convert(61),
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          headline3: GoogleFonts.bellefair(
            fontSize: convert(48),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          headline4: GoogleFonts.bellefair(
            fontSize: convert(34),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          headline5: GoogleFonts.bellefair(
            fontSize: convert(24),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          headline6: GoogleFonts.bellefair(
            fontSize: convert(20),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          subtitle1: GoogleFonts.bellefair(
            fontSize: convert(16),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          subtitle2: GoogleFonts.bellefair(
            fontSize: convert(14),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          bodyText1: GoogleFonts.bellefair(
            fontSize: convert(16),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          bodyText2: GoogleFonts.bellefair(
            fontSize: convert(14),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          button: GoogleFonts.bellefair(
            fontSize: convert(14),
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          caption: GoogleFonts.bellefair(
            fontSize: convert(12),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          overline: GoogleFonts.bellefair(
            fontSize: convert(10),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: RouterHelper.start,
      onGenerateRoute: RouterHelper.generateRoute,
    );
  }
}
