class Person {
  String name;
  int times;

  Person(this.name) : times = 1;

  Person.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        times = json["times"];

  Map<String, dynamic> toJson() => {
        "name": name,
        "times": times,
      };
}
