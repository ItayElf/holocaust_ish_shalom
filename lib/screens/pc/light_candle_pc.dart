import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/classes/person.dart';
import 'package:holocaust_ish_shalom/services/person_orm.dart';
import 'package:holocaust_ish_shalom/utils.dart';

class LightCandlePc extends StatelessWidget {
  LightCandlePc({Key? key}) : super(key: key);

  final TextEditingController name = TextEditingController();

  void light(BuildContext context) async {
    if (name.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "נא להכניס שם",
            style: Theme.of(context).textTheme.headline3,
            textDirection: TextDirection.rtl,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    } else if (name.text == "נר כללי") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "כדי להדליק נר כללי יש לגשת לדף נר כללי",
            style: Theme.of(context).textTheme.headline3,
            textDirection: TextDirection.rtl,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }
    try {
      Person p = await PersonOrm.getPerson(name.text);
      p.times += 1;
      await PersonOrm.updateOrAddPerson(p);
    } catch (e) {
      await PersonOrm.updateOrAddPerson(Person(name.text));
    }
    Navigator.of(context).pushNamed("/lit", arguments: name.text);
  }

  @override
  Widget build(BuildContext context) {
    const candleWidth = 30;
    final int candles = MediaQuery.of(context).size.width ~/ candleWidth;
    return Scaffold(
      body: Builder(
        builder: (context) => Column(
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
                          SizedBox(
                            height: convert(50),
                          ),
                          TextFormField(
                            controller: name,
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.black),
                            cursorColor: Theme.of(context).primaryColorDark,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(convert(15)),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(convert(15)),
                                ),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                              filled: true,
                              fillColor: Theme.of(context).primaryColorLight,
                              hintText: "שם",
                              hintTextDirection: TextDirection.rtl,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: Colors.black.withAlpha(127)),
                            ),
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
      ),
    );
  }
}
