import 'package:flutter/material.dart';

class MainScreenPhone extends StatelessWidget {
  const MainScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int candles = MediaQuery.of(context).size.width ~/ 30;
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/yellow_badge.png",
                  width: 100,
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
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                candles,
                (i) => Image.asset(
                  "candle.gif",
                  height: MediaQuery.of(context).size.height / 6.4,
                ),
              ),
            ),
            bottom: 0,
          ),
        ],
      ),
    );
  }
}
