import 'package:flutter/material.dart';

class MainScreenPhone extends StatelessWidget {
  const MainScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "יום השואה הבינלאומי - איש שלום",
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        ],
      ),
    );
  }
}
