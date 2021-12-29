import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/screens/pc/main_screen_pc.dart';
import 'package:holocaust_ish_shalom/screens/phone/main_screen_phone.dart';
import 'package:holocaust_ish_shalom/widgets/custom_page_route.dart';
import 'package:holocaust_ish_shalom/widgets/switcher.dart';

class RouterHelper {
  static const String start = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return CustomPageRoute(
          builder: (_) => const Switcher(
            phone: MainScreenPhone(),
            pc: MainScreenPc(),
          ),
        );
      default:
        return CustomPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('שגיאה: הדף לא נמצא.'),
            ),
          ),
        );
    }
  }
}
