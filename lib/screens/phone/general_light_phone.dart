import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/classes/person.dart';
import 'package:holocaust_ish_shalom/services/person_orm.dart';
import 'package:holocaust_ish_shalom/utils.dart';

class GeneralLightPhone extends StatelessWidget {
  const GeneralLightPhone({Key? key}) : super(key: key);

  void light(BuildContext context) async {
    Person p = await PersonOrm.getPerson("~general~");
    p.times += 1;
    await PersonOrm.updateOrAddPerson(p, "~general~");
    Navigator.of(context).pushNamed("/lit", arguments: "~general~");
  }

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
                    "הדלקת נר כללי",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    "נר כללי לזכר כל הנספים בשואה",
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: convert(25),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      light(context);
                    },
                    child: Text(
                      "הדלקת נר",
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
