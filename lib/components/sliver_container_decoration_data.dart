import 'package:flutter/material.dart';

//Upper container in sliver Widget list.
var containerDecorationData = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.cyan.shade700, Colors.cyan.shade400.withOpacity(0.7)]),
    borderRadius: BorderRadius.circular(15));
var containerDecorationDataDark = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color.fromARGB(255, 59, 62, 69),
          const Color.fromARGB(255, 57, 58, 65).withOpacity(0.7)
        ]),
    borderRadius: BorderRadius.circular(15));

//Lower container in sliver Widget list.
var containerDecorationData2 = BoxDecoration(
    color: Colors.transparent, borderRadius: BorderRadius.circular(15));
