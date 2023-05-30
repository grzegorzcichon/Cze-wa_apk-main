import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Districts>> getItem() async {
  const url =
      'https://raw.githubusercontent.com/grzegorzcichon/Czestochowa/main/Dzielnice.json';
  final response = await http.get(Uri.parse(url));

  final body = json.decode(response.body);

  return body.map<Districts>(Districts.fromJson).toList();
}

class Districts {
  final String name;
  final String population;
  final String urlAvatar;
  final String description;

  const Districts({
    required this.name,
    required this.population,
    required this.urlAvatar,
    required this.description,
  });

  factory Districts.fromJson(dynamic json) {
    return Districts(
      name: json['name'],
      population: json['population'],
      urlAvatar: json['urlAvatar'],
      description: json['description'],
    );
  }
}
