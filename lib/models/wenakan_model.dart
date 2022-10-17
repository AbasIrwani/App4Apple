import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Wenakan {
  final String title;
  final String description;
  final String date;
  final String link;

  const Wenakan(
      {required this.title,
      required this.description,
      required this.date,
      required this.link});

  factory Wenakan.fromJson(Map<String, dynamic> json) {
    return Wenakan(
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      link: json['link'] as String,
    );
  }
}

Future<List<Wenakan>> parseWenakan(String responseBody) async {
  final parsed = await jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Wenakan>((json) => Wenakan.fromJson(json)).toList();
}

Future<List<Wenakan>> getWenakan(http.Client wclient) async {
  final response = await wclient
      .get(Uri.parse("https://api.npoint.io/53902c34ca1dd9189910"));
  return compute(parseWenakan, response.body);
}
