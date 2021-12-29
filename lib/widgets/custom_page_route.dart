import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/widgets/router_helper.dart';

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.name == RouterHelper.start) return child;
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
