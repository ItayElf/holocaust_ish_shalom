import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/utils.dart';

class MainScreenPc extends StatelessWidget {
  const MainScreenPc({Key? key}) : super(key: key);

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
                    width: convert(200),
                  ),
                  Text(
                    "יום השואה הבינלאומי",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "איש שלום",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: convert(25),
                  ),
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/light");
                          },
                          child: Text(
                            "הדלקת נר עם שם",
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: convert(25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/general");
                          },
                          child: Text(
                            "הדלקת נר כללי",
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: convert(25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/all");
                          },
                          child: Text(
                            "צפייה בנרות שהודלקו",
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
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
