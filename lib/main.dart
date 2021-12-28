import 'package:flutter/material.dart';
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
      title: 'Holocaust Ish Shalom',
      theme: ThemeData.dark(),
      home: const Switcher(
        phone: MainScreenPhone(),
        pc: Text("Web"),
      ),
    );
  }
}
