import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/classes/person.dart';
import 'package:holocaust_ish_shalom/services/person_orm.dart';
import 'package:holocaust_ish_shalom/utils.dart';

class GeneralLightPc extends StatelessWidget {
  const GeneralLightPc({Key? key}) : super(key: key);

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
                    width: convert(200),
                  ),
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "הדלקת נר עם שם",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          "נר כללי לזכר כל הנספים בשואה",
                          style: Theme.of(context).textTheme.headline3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: convert(50),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            light(context);
                          },
                          child: Text(
                            "הדלקת נר",
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
