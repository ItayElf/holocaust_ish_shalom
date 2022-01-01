import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holocaust_ish_shalom/classes/person.dart';

class PersonOrm {
  static final _people = FirebaseFirestore.instance.collection("people");

  static Stream<List<Person>> get people =>
      _people.snapshots().map(_personFromSnap);

  static List<Person> _personFromSnap(QuerySnapshot snapshot) {
    return snapshot.docs.map<Person>((e) {
      final Map<String, dynamic> json = e.data() as Map<String, dynamic>;
      return Person.fromJson(json);
    }).toList();
  }

  static Future<Person> getPerson(String name) async {
    final data = (await _people.doc(name).get()).data();
    if (data == null) {
      throw Exception("Person $name was not found");
    }
    return Person.fromJson(data);
  }

  static Future<void> updateOrAddPerson(Person person) async {
    _people.doc(person.name).set(person.toJson());
  }
}
