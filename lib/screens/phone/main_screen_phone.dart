import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/utils.dart';

class MainScreenPhone extends StatelessWidget {
  const MainScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const candleWidth = 30;
    final int candles = MediaQuery.of(context).size.width ~/ candleWidth;
    return Material(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/yellow_badge.png",
                    width: convert(100),
                  ),
                  Text(
                    "יום השואה הבינלאומי\n איש שלום",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "הדלקת נר עם שם",
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "הדלקת נר כללי",
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                candles,
                (i) => Image.asset(
                  "assets/candle.gif",
                  width: candleWidth.toDouble(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
