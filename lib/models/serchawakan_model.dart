import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Serchawekan {
  final String title;
  final dynamic description;
  final String link;
  final String reccommended;
  final String icon;

  const Serchawekan({
    required this.title,
    required this.description,
    required this.link,
    required this.reccommended,
    required this.icon,
  });

  factory Serchawekan.fromJson(Map<String, dynamic> json) {
    return Serchawekan(
      title: json['title'] as String,
      description: json['description'] as dynamic,
      link: json['link'] as String,
      reccommended: json['reccommended'] as String,
      icon: json['icon'] as String,
    );
  }
}

List<Serchawekan> parseSerchawekan(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Serchawekan>((json) => Serchawekan.fromJson(json)).toList();
}

Future<List<Serchawekan>> getSerchawekan(http.Client pclient) async {
  final response = await pclient
      .get(Uri.parse("https://api.npoint.io/a5f782b19638a91bbd6a"));
  return compute(parseSerchawekan, response.body);
}
