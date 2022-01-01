import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/screens/pc/all_candles_pc.dart';
import 'package:holocaust_ish_shalom/screens/pc/light_candle_pc.dart';
import 'package:holocaust_ish_shalom/screens/pc/lit_candle_pc.dart';
import 'package:holocaust_ish_shalom/screens/pc/main_screen_pc.dart';
import 'package:holocaust_ish_shalom/screens/phone/all_candles_phone.dart';
import 'package:holocaust_ish_shalom/screens/phone/light_candle_phone.dart';
import 'package:holocaust_ish_shalom/screens/phone/lit_candle_phone.dart';
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
      case "/light":
        return CustomPageRoute(
          builder: (_) => Switcher(
            phone: LightCandlePhone(),
            pc: LightCandlePc(),
          ),
          settings: settings,
        );
      case "/lit":
        final data = settings.arguments as String;
        return CustomPageRoute(
          builder: (_) => Switcher(
            phone: LitCandlePhone(name: data),
            pc: LitCandlePc(name: data),
          ),
          settings: settings,
        );
      case "/all":
        return CustomPageRoute(
          builder: (_) => const Switcher(
            phone: AllCandlesPhone(),
            pc: AllCandlesPc(),
          ),
          settings: settings,
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
