import 'package:flutter/material.dart';
import 'package:holocaust_ish_shalom/classes/person.dart';
import 'package:holocaust_ish_shalom/services/person_orm.dart';
import 'package:holocaust_ish_shalom/utils.dart';

class LitCandlePhone extends StatelessWidget {
  const LitCandlePhone({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: Person(""),
      future: PersonOrm.getPerson(name),
      builder: (contest, snapshot) {
        if (snapshot.data == null) {
          return Material(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/yellow_badge.png",
                    width: convert(75),
                  ),
                  Text(
                    "קרתה שגיאה",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
          );
        }
        if ((snapshot.data as Person).name.isEmpty) {
          return Material(
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        }
        Person p = snapshot.data as Person;
        return Material(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/candle.gif",
                  width: convert(75),
                ),
                Text(
                  p.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  getTimesString(p),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: convert(25),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/all");
                  },
                  child: Text(
                    "צפייה בכל הנרות שהודלקו",
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
