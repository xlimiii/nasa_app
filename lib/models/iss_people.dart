import 'dart:convert';
import 'package:http/http.dart' as http;


class ISSPerson {
  final String name;
  final String craft;
  ISSPerson({this.name, this.craft});

  factory ISSPerson.fromJson(Map<String, dynamic> json) {
    return ISSPerson(
      name: json['name'],
      craft: json['craft'],
    );
  }
}

class ISSPeople {
  final int number;
  final String message;
  final List<ISSPerson> people;

  ISSPeople({this.number, this.message, this.people});
}

Future<ISSPeople> getPeopleAtISS() async {
  final url = Uri.parse('http://api.open-notify.org/astros.json');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final number = responseBody["number"];
    final message = responseBody["message"];
    final people = responseBody["people"];
    final List<ISSPerson> finalPeople = [];
    people.forEach((e) =>
        finalPeople.add(new ISSPerson(name: e['name'], craft: e['craft'])));
    final ISSPeople peopleAtISS =
        new ISSPeople(number: number, message: message, people: finalPeople);
    return peopleAtISS;
  } else {
    throw Exception('Failed to load people at ISS');
  }
}
