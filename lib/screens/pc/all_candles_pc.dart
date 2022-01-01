import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/classes/person.dart';
import 'package:holocaust_ish_shalom/services/person_orm.dart';
import 'package:holocaust_ish_shalom/utils.dart';

class AllCandlesPc extends StatelessWidget {
  const AllCandlesPc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: [Person("נר כללי")],
      stream: PersonOrm.people,
      builder: (context, snapshot) {
        List<Person> list = snapshot.data! as List<Person>;
        Person general =
            list.where((element) => element.name == "נר כללי").toList()[0];
        list = list.where((element) => element.name != "נר כללי").toList();
        list.shuffle();
        return Material(
          child: Padding(
            padding: EdgeInsets.all(convert(20)),
            child: Column(
              children: [
                Text(
                  "נרות שהודלקו",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "נר כללי הודלק על ידי ${general.times} אנשים",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const Divider(),
                SizedBox(
                  height: convert(30),
                ),
                Expanded(
                  child: list.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/candle.gif",
                                width: convert(100),
                              ),
                              Text(
                                "לא הודלקו עוד נרות",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ],
                          ),
                        )
                      : Directionality(
                          textDirection: TextDirection.rtl,
                          child: GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: convert(10),
                            children: list
                                .map(
                                  (e) => Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(convert(7)))),
                                      child: Padding(
                                        padding: EdgeInsets.all(convert(15)),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/candle.gif",
                                                width: convert(50),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  e.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  getTimesString(e, true),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
