// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
//
// class ZanyariGshti {
//   final String prsyar;
//   final String bzharda1;
//   final String bzharda2;
//   final String bzharda3;
//   final String bzharda4;
//   final String welam;
//   final String band;
//
//   const ZanyariGshti(
//       {required this.prsyar,
//       required this.bzharda1,
//       required this.bzharda2,
//       required this.bzharda3,
//       required this.bzharda4,
//       required this.welam,
//       required this.band});
//
//   factory ZanyariGshti.fromJson(Map<String, dynamic> json) {
//     return ZanyariGshti(
//         prsyar: json['prsyar'] as String,
//         bzharda1: json['bzharda1'] as String,
//         bzharda2: json['bzharda2'] as String,
//         bzharda3: json['bzharda3'] as String,
//         bzharda4: json['bzharda4'] as String,
//         welam: json['welam'] as String,
//         band: json['band'] as String);
//   }
// }
//
// List<ZanyariGshti> parsedZanyariGshti(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   return parsed
//       .map<ZanyariGshti>((json) => ZanyariGshti.fromJson(json))
//       .toList();
// }
//
// Future<List<ZanyariGshti>> getZanyariGshti(http.Client zgclient) async {
//   final response = await zgclient.get(Uri.parse(
//       "https://raw.githubusercontent.com/Irwan-Saka/irwansakaschool/main/test.json"));
//   return compute(parsedZanyariGshti, response.body);
// }
