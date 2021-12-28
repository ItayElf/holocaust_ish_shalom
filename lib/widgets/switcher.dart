import 'package:flutter/material.dart';

class Switcher extends StatelessWidget {
  const Switcher({
    Key? key,
    required this.phone,
    required this.pc,
  }) : super(key: key);

  final Widget phone;
  final Widget pc;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
          constraints.maxHeight > constraints.maxWidth ? phone : pc,
    );
  }
}
