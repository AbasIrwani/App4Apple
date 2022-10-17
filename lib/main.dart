import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irwansaka/components/app_theme_data.dart';

import 'components/app_theme_switch.dart';
import 'pages/mobile_sereki.dart';

AppTheme currentTheme = AppTheme();
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    currentTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: mainTheme,
        darkTheme: darkTheme,
        themeMode: currentTheme.currentTheme(),
        debugShowCheckedModeBanner: false,
        home: const MobileSereki());
  }
}
