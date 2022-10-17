import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Pertukakan {
  final String bookname;
  final String pages;
  final String booktype;
  final String name;
  final String thumb;
  final String viewlink;
  final String downlink;

  const Pertukakan({
    required this.bookname,
    required this.pages,
    required this.booktype,
    required this.name,
    required this.thumb,
    required this.viewlink,
    required this.downlink,
  });

  factory Pertukakan.fromJson(Map<String, dynamic> json) {
    return Pertukakan(
        bookname: json['bookname'] as String,
        pages: json['pages'] as String,
        booktype: json['booktype'] as String,
        name: json['name'] as String,
        thumb: json['thumb'] as String,
        viewlink: json['viewlink'] as String,
        downlink: json['downlink'] as String);
  }
}

List<Pertukakan> parsePartukakan(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Pertukakan>((json) => Pertukakan.fromJson(json)).toList();
}

Future<List<Pertukakan>> getPartukakan(http.Client pclient) async {
  final response = await pclient.get(Uri.parse(
      "https://raw.githubusercontent.com/Irwan-Saka/irwansakaschool/main/pertukekan.json"));
  return compute(parsePartukakan, response.body);
}
