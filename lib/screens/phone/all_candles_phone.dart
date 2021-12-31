import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/classes/person.dart';
import 'package:holocaust_ish_shalom/services/person_orm.dart';
import 'package:holocaust_ish_shalom/utils.dart';

class AllCandlesPhone extends StatelessWidget {
  const AllCandlesPhone({Key? key}) : super(key: key);

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
            padding: EdgeInsets.all(convert(10)),
            child: Column(
              children: [
                Text(
                  "נרות שהודלקו",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  "נר כללי הודלק על ידי ${general.times} אנשים",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Divider(),
                SizedBox(
                  height: convert(15),
                ),
                Expanded(
                  child: list.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/candle.gif",
                                width: convert(50),
                              ),
                              Text(
                                "לא הודלקו עוד נרות",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          itemCount: list.length,
                          itemBuilder: (context, i) => Card(
                            child: Padding(
                              padding: EdgeInsets.all(convert(15)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    "assets/candle.gif",
                                    width: convert(35),
                                  ),
                                  Text(
                                    list[i].name,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Text(
                                    getTimesString(list[i], true),
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, i) => SizedBox(
                            height: convert(5),
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
