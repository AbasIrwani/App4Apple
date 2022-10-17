import 'dart:io';
import 'dart:math' as math;

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/appbar_sys_uioverlay.dart';
import '../components/sliver_container_decoration_data.dart';
import '../models/pertukakan_model.dart';

class Lib extends StatefulWidget {
  const Lib({super.key});
  @override
  State<Lib> createState() => _LibState();
}

class _LibState extends State<Lib> {
  Future refreshLibData() async {
    setState(() {
      getPartukakan(http.Client());
    });
    return const Lib();
  }

  @override
  Widget build(BuildContext context) {
    const String title = "په‌رتوکخانه‌";
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        scrolledUnderElevation: 20,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).scaffoldBackgroundColor ==
                  const Color(0xff1E1F20)
              ? appbarTitleDataDark
              : appbarTitleData,
        ),
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            IconButton(
                splashRadius: 25,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: Theme.of(context).scaffoldBackgroundColor ==
                          const Color(0xff1E1F20)
                      ? Colors.cyan.shade500
                      : Colors.cyan.shade800,
                  size: 35,
                )),
          ],
        ),
      ),
      body: FutureBuilder<List<Pertukakan>>(
        future: getPartukakan(http.Client()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return RefreshIndicator(
              color: Theme.of(context).scaffoldBackgroundColor ==
                      const Color(0xff1E1F20)
                  ? Colors.cyan
                  : Colors.cyan,
              onRefresh: () => refreshLibData(),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height / 2.4,
                    child: const Icon(
                      Ionicons.cloud_offline_sharp,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height / 2.3,
                      child: const Text(
                        "!کێشه‌ له‌ وه‌رگرتنی زانیاری هه‌یه‌",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return LibData(
              pertuk: snapshot.data! as List<Pertukakan>,
              eList: const [],
              nList: const [],
            );
          } else {
            return Center(
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Lottie.asset("assets/loading.json",
                        frameRate: FrameRate.composition, animate: true)));
          }
        },
      ),
    );
  }
}

class LibData extends StatefulWidget {
  LibData({
    super.key,
    required this.pertuk,
    required this.eList,
    required this.nList,
  });
  final List<Pertukakan> pertuk;
  List<Pertukakan> eList;
  List<Pertukakan> nList;
  @override
  State<LibData> createState() => _LibDataState();
}

class _LibDataState extends State<LibData> {
  String selectedFilter = "null";
  String selectedPages = "null";

  String toArabicNums(String arabicinput) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = [
      '٠',
      '١',
      '٢',
      '٣',
      '٤',
      '٥',
      '٦',
      '٧',
      '٨',
      '٩',
    ];

    for (int i = 0; i < english.length; i++) {
      arabicinput = arabicinput.replaceAll(english[i], arabic[i]);
    }

    return arabicinput;
  }

  String toEnglishNums(String englishinput) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = [
      '٠',
      '١',
      '٢',
      '٣',
      '٤',
      '٥',
      '٦',
      '٧',
      '٨',
      '٩',
    ];

    for (int i = 0; i < arabic.length; i++) {
      englishinput = englishinput.replaceAll(arabic[i], english[i]);
    }

    return englishinput;
  }

  get index => widget.pertuk[index];

  @override
  void initState() {
    widget.eList = widget.pertuk;
    super.initState();
  }

  void _filterGet(String term) {
    if (term.isNotEmpty) {
      widget.nList = widget.pertuk
          .where((element) =>
              element.bookname.characters.startsWith(term.characters))
          .toList();
    }
    if (term.isEmpty) {
      widget.nList = widget.pertuk;
    } else {
      widget.nList = widget.pertuk
          .where((element) => element.bookname.contains(term))
          .toList();
    }
    if (term.contains("  ")) {
      return;
    } else {
      widget.nList = widget.pertuk
          .where((element) => element.bookname.contains(term))
          .toList();
    }
    setState(() {
      widget.eList = widget.nList;
    });
  }

  Future<void> refreshScreen() async {
    setState(() {
      widget.eList = widget.pertuk;
    });
  }

  void _filterFlush(String fill) {
    widget.nList = widget.pertuk
        .where((element) => element.booktype.contains(fill))
        .toList();
    setState(() {
      widget.eList = widget.nList;
    });
  }

  void _showFilter() {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor ==
                      const Color(0xff1E1F20)
                  ? const Color(0xff1E1F20)
                  : const Color(0xfff7f7f7),
              borderRadius: BorderRadius.circular(15)),
          constraints: const BoxConstraints(maxHeight: 350, maxWidth: 350),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "پۆلێن",
                  style: Theme.of(context).scaffoldBackgroundColor ==
                          const Color(0xff1E1F20)
                      ? appbarTitleDataDark
                      : appbarTitleData,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "پەرتوکەکان بە پێی جۆر پۆلێن بکە.",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontFamily: 'ir-sharp-m',
                        fontSize: MediaQuery.of(context).size.width / 30,
                        color: Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xff1E1F20)
                            ? const Color(0xfff7f7f7)
                            : const Color(0xff1E1F20)),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor ==
                            const Color(0xff1E1F20)
                        ? const Color.fromARGB(255, 50, 49, 49)
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: GestureDetector(
                  onTap: () {
                    Feedback.forTap(context);
                    showDialog(
                        context: context,
                        builder: (context) => Center(
                              child: Container(
                                height: 285,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                                .scaffoldBackgroundColor ==
                                            const Color(0xff1E1F20)
                                        ? const Color(0xff1E1F20)
                                        : const Color(0xfff7f7f7),
                                    borderRadius: BorderRadius.circular(10)),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            selectedFilter = "null";
                                            Navigator.pop(context);
                                            Feedback.forTap(context);
                                            setState(() {
                                              widget.eList = widget.pertuk;
                                            });
                                          },
                                          child: SizedBox(
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "هەموو",
                                                style: TextStyle(
                                                    fontFamily: 'ir-sharp-m',
                                                    color: Theme.of(context)
                                                                .scaffoldBackgroundColor ==
                                                            const Color(
                                                                0xff1E1F20)
                                                        ? const Color(
                                                            0xfff7f7f7)
                                                        : const Color(
                                                            0xff1E1F20),
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )),
                                      Divider(
                                        height: 10,
                                        color: Theme.of(context)
                                                    .scaffoldBackgroundColor ==
                                                const Color(0xff1E1F20)
                                            ? Colors.grey.shade700
                                            : Colors.grey.shade200,
                                        thickness: 1.2,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            selectedFilter =
                                                "پەرتوکی قوتابخانە";
                                            Navigator.pop(context);
                                            Feedback.forTap(context);
                                            setState(() {
                                              String fill = "پەرتوکی قوتابخانە";
                                              _filterFlush(fill);
                                            });
                                          },
                                          child: SizedBox(
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "پەرتوکی قوتابخانە",
                                                style: TextStyle(
                                                    fontFamily: 'ir-sharp-m',
                                                    color: Theme.of(context)
                                                                .scaffoldBackgroundColor ==
                                                            const Color(
                                                                0xff1E1F20)
                                                        ? const Color(
                                                            0xfff7f7f7)
                                                        : const Color(
                                                            0xff1E1F20),
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )),
                                      Divider(
                                        height: 10,
                                        color: Theme.of(context)
                                                    .scaffoldBackgroundColor ==
                                                const Color(0xff1E1F20)
                                            ? Colors.grey.shade700
                                            : Colors.grey.shade200,
                                        thickness: 1.2,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            selectedFilter = "زانیاری";
                                            Navigator.pop(context);
                                            Feedback.forTap(context);
                                            setState(() {
                                              String fill = "زانیاری";
                                              _filterFlush(fill);
                                            });
                                          },
                                          child: SizedBox(
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "زانیاری",
                                                style: TextStyle(
                                                    fontFamily: 'ir-sharp-m',
                                                    color: Theme.of(context)
                                                                .scaffoldBackgroundColor ==
                                                            const Color(
                                                                0xff1E1F20)
                                                        ? const Color(
                                                            0xfff7f7f7)
                                                        : const Color(
                                                            0xff1E1F20),
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )),
                                      Divider(
                                        height: 10,
                                        color: Theme.of(context)
                                                    .scaffoldBackgroundColor ==
                                                const Color(0xff1E1F20)
                                            ? Colors.grey.shade700
                                            : Colors.grey.shade200,
                                        thickness: 1.2,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            selectedFilter = "هۆنراوە";
                                            Navigator.pop(context);
                                            Feedback.forTap(context);
                                            setState(() {
                                              String fill = "هۆنراوە";
                                              _filterFlush(fill);
                                            });
                                          },
                                          child: SizedBox(
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "هۆنراوە",
                                                style: TextStyle(
                                                    fontFamily: 'ir-sharp-m',
                                                    color: Theme.of(context)
                                                                .scaffoldBackgroundColor ==
                                                            const Color(
                                                                0xff1E1F20)
                                                        ? const Color(
                                                            0xfff7f7f7)
                                                        : const Color(
                                                            0xff1E1F20),
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )),
                                      Divider(
                                        height: 10,
                                        color: Theme.of(context)
                                                    .scaffoldBackgroundColor ==
                                                const Color(0xff1E1F20)
                                            ? Colors.grey.shade700
                                            : Colors.grey.shade200,
                                        thickness: 1.2,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            selectedFilter = "چیرۆک";
                                            Navigator.pop(context);
                                            Feedback.forTap(context);
                                            setState(() {
                                              String fill = "چیرۆک";
                                              _filterFlush(fill);
                                            });
                                          },
                                          child: SizedBox(
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "چیرۆک",
                                                style: TextStyle(
                                                    fontFamily: 'ir-sharp-m',
                                                    color: Theme.of(context)
                                                                .scaffoldBackgroundColor ==
                                                            const Color(
                                                                0xff1E1F20)
                                                        ? const Color(
                                                            0xfff7f7f7)
                                                        : const Color(
                                                            0xff1E1F20),
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )),
                                      Divider(
                                        height: 10,
                                        color: Theme.of(context)
                                                    .scaffoldBackgroundColor ==
                                                const Color(0xff1E1F20)
                                            ? Colors.grey.shade700
                                            : Colors.grey.shade200,
                                        thickness: 1.2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  },
                  child: Text(
                    "جۆری پەرتوک",
                    style: TextStyle(
                      fontFamily: 'ir-sharp-m',
                      color: Theme.of(context).scaffoldBackgroundColor ==
                              const Color(0xff1E1F20)
                          ? const Color(0xfff7f7f7)
                          : const Color(0xff1E1F20),
                      fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "پەرتوکەکان بە پێی ژمارەی لاپەڕەکان پۆلێن بکە.",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'ir-sharp-m',
                      fontSize: MediaQuery.of(context).size.width / 30,
                      color: Theme.of(context).scaffoldBackgroundColor ==
                              const Color(0xff1E1F20)
                          ? const Color(0xfff7f7f7)
                          : const Color(0xff1E1F20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor ==
                            const Color(0xff1E1F20)
                        ? const Color.fromARGB(255, 50, 49, 49)
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      showDialog(
                          context: context,
                          builder: (context) => Center(
                                child: Container(
                                  height: 285,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                                  .scaffoldBackgroundColor ==
                                              const Color(0xff1E1F20)
                                          ? const Color(0xff1E1F20)
                                          : const Color(0xfff7f7f7),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              selectedPages = "null";
                                              Navigator.pop(context);
                                              Feedback.forTap(context);
                                              setState(() {
                                                widget.eList = widget.pertuk;
                                              });
                                            },
                                            child: SizedBox(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "هەموو",
                                                  style: TextStyle(
                                                      fontFamily: 'ir-sharp-m',
                                                      color: Theme.of(context)
                                                                  .scaffoldBackgroundColor ==
                                                              const Color(
                                                                  0xff1E1F20)
                                                          ? const Color(
                                                              0xfff7f7f7)
                                                          : const Color(
                                                              0xff1E1F20),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                        Divider(
                                          height: 10,
                                          color: Theme.of(context)
                                                      .scaffoldBackgroundColor ==
                                                  const Color(0xff1E1F20)
                                              ? Colors.grey.shade700
                                              : Colors.grey.shade200,
                                          thickness: 1.2,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              selectedPages =
                                                  "کەمتر لە ٢٥ لاپەڕە";
                                              Navigator.pop(context);
                                              Feedback.forTap(context);
                                              setState(() {
                                                widget.eList = widget.eList
                                                    .where((element) =>
                                                        int.parse(
                                                            element.pages) <
                                                        25)
                                                    .toList();
                                              });
                                            },
                                            child: SizedBox(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "کەمتر لە ٢٥ لاپەڕە",
                                                  style: TextStyle(
                                                      fontFamily: 'ir-sharp-m',
                                                      color: Theme.of(context)
                                                                  .scaffoldBackgroundColor ==
                                                              const Color(
                                                                  0xff1E1F20)
                                                          ? const Color(
                                                              0xfff7f7f7)
                                                          : const Color(
                                                              0xff1E1F20),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                        Divider(
                                          height: 10,
                                          color: Theme.of(context)
                                                      .scaffoldBackgroundColor ==
                                                  const Color(0xff1E1F20)
                                              ? Colors.grey.shade700
                                              : Colors.grey.shade200,
                                          thickness: 1.2,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              selectedPages =
                                                  "کەمتر لە ٥٠ لاپەڕە";
                                              Navigator.pop(context);
                                              Feedback.forTap(context);
                                              setState(() {
                                                widget.eList = widget.eList
                                                    .where((element) =>
                                                        int.parse(
                                                            element.pages) <
                                                        50)
                                                    .toList();
                                              });
                                            },
                                            child: SizedBox(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "کەمتر لە ٥٠ لاپەڕە",
                                                  style: TextStyle(
                                                      fontFamily: 'ir-sharp-m',
                                                      color: Theme.of(context)
                                                                  .scaffoldBackgroundColor ==
                                                              const Color(
                                                                  0xff1E1F20)
                                                          ? const Color(
                                                              0xfff7f7f7)
                                                          : const Color(
                                                              0xff1E1F20),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                        Divider(
                                          height: 10,
                                          color: Theme.of(context)
                                                      .scaffoldBackgroundColor ==
                                                  const Color(0xff1E1F20)
                                              ? Colors.grey.shade700
                                              : Colors.grey.shade200,
                                          thickness: 1.2,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              selectedPages =
                                                  "کەمتر لە ١٠٠ لا پەڕە";
                                              Navigator.pop(context);
                                              Feedback.forTap(context);
                                              setState(() {
                                                widget.eList = widget.eList
                                                    .where((element) =>
                                                        int.parse(
                                                            element.pages) <
                                                        100)
                                                    .toList();
                                              });
                                            },
                                            child: SizedBox(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "کەمتر لە ١٠٠ لا پەڕە",
                                                  style: TextStyle(
                                                      fontFamily: 'ir-sharp-m',
                                                      color: Theme.of(context)
                                                                  .scaffoldBackgroundColor ==
                                                              const Color(
                                                                  0xff1E1F20)
                                                          ? const Color(
                                                              0xfff7f7f7)
                                                          : const Color(
                                                              0xff1E1F20),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                        Divider(
                                          height: 10,
                                          color: Theme.of(context)
                                                      .scaffoldBackgroundColor ==
                                                  const Color(0xff1E1F20)
                                              ? Colors.grey.shade700
                                              : Colors.grey.shade200,
                                          thickness: 1.2,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              selectedPages =
                                                  "زیاتر لە ١٠٠ لاپەڕە";
                                              Navigator.pop(context);
                                              Feedback.forTap(context);
                                              setState(() {
                                                widget.eList = widget.eList
                                                    .where((element) =>
                                                        int.parse(
                                                            element.pages) >
                                                        100)
                                                    .toList();
                                              });
                                            },
                                            child: SizedBox(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "زیاتر لە ١٠٠ لاپەڕە",
                                                  style: TextStyle(
                                                      fontFamily: 'ir-sharp-m',
                                                      color: Theme.of(context)
                                                                  .scaffoldBackgroundColor ==
                                                              const Color(
                                                                  0xff1E1F20)
                                                          ? const Color(
                                                              0xfff7f7f7)
                                                          : const Color(
                                                              0xff1E1F20),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                        Divider(
                                          height: 10,
                                          color: Theme.of(context)
                                                      .scaffoldBackgroundColor ==
                                                  const Color(0xff1E1F20)
                                              ? Colors.grey.shade700
                                              : Colors.grey.shade200,
                                          thickness: 1.2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                    },
                    child: Text(
                      "ژمارەی لاپەڕەکان",
                      style: TextStyle(
                        fontFamily: 'ir-sharp-m',
                        color: Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xff1E1F20)
                            ? const Color(0xfff7f7f7)
                            : const Color(0xff1E1F20),
                        fontSize: MediaQuery.of(context).size.width / 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final scrollController = ScrollController();
  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> quotes = [
      '''"بەدەست هێنانی زانست و زانین ئەرکی سەرشانی هەموو موسڵمانێکە." \n - محمد (د.خ)''',
      '''"سێ شت لە جوانی مرۆڤ زیاد دەکەن: ئەدەب و زانین و ڕەوشتی جوان." \n - وتەی عەرەبی''',
      '''"زانست و زانین گەنجینەیەکە لە هەموو شوێنێک لەگەڵ خاوەنەکەیتی." \n - وتەی چینی''',
      '''"بەهای مرۆڤ لەو شتانە دایە کە دەیزانێت." \n - فرانسیس بەیکن''',
      '''"ژیری و تێگەیشتوویی واتە بتوانی خۆت بگۆڕی." \n - ستیڤن هۆکینگ''',
      "لە ئێستادا پەرتوکخانە ${toArabicNums(widget.pertuk.length.toInt().toString())} پەرتوک لەخۆدەگرێت"
          "",
    ];
    int quote = quotes.length;
    var rand = math.Random();
    var val = rand.nextInt(quote);

    return RefreshIndicator(
      onRefresh: () => refreshScreen(),
      child: ListView(
        controller: scrollController,
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4, left: 4),
                child: GestureDetector(
                  onTap: () {
                    _showFilter();
                    Feedback.forTap(context);
                  },
                  child: Container(
                    width: 62,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xff1E1F20)
                            ? Colors.grey.shade800
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Ionicons.filter,
                      size: 30,
                      color: Theme.of(context).scaffoldBackgroundColor ==
                              const Color(0xff1E1F20)
                          ? Colors.grey.shade400
                          : const Color(0xff1E1F20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width + (-70),
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: TextField(
                    onTap: () {
                      if (textcontroller.selection ==
                          TextSelection.fromPosition(TextPosition(
                              offset: textcontroller.text.length - 1))) {
                        setState(() {
                          textcontroller.selection = TextSelection.fromPosition(
                              TextPosition(offset: textcontroller.text.length));
                        });
                      }
                    },
                    controller: textcontroller,
                    onChanged: (term) => _filterGet(term),
                    cursorHeight: 30,
                    cursorColor: Colors.cyan,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hintText: 'گەڕان:   ناوی پەرتوک...',
                        hintStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 25,
                          fontFamily: 'ir-sharp-m',
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context).scaffoldBackgroundColor ==
                                  const Color(0xff1E1F20)
                              ? Colors.grey.shade400
                              : const Color(0xff1E1F20),
                        ),
                        hintTextDirection: TextDirection.rtl,
                        filled: true,
                        fillColor: Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xff1E1F20)
                            ? Colors.grey.shade800
                            : Colors.grey.shade200,
                        prefixIcon: Icon(
                          Ionicons.search,
                          size: 30,
                          color: Theme.of(context).scaffoldBackgroundColor ==
                                  const Color(0xff1E1F20)
                              ? Colors.grey.shade400
                              : const Color(0xff1E1F20),
                        ),
                        disabledBorder: InputBorder.none,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 4,
              ),
              selectedPages == "null"
                  ? const SizedBox(
                      height: 0,
                    )
                  : Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      alignment: Alignment.center,
                      height: 30,
                      width: selectedPages == "null"
                          ? 50
                          : (selectedPages.characters.length.toDouble() * 5) +
                              60,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor ==
                                  const Color(0xff1e1f20)
                              ? Colors.grey.shade800
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            selectedPages,
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                              onTap: () {
                                Feedback.forTap(context);
                                setState(() {
                                  selectedPages = "null";
                                  widget.eList = widget.pertuk
                                      .where((element) =>
                                          int.parse(element.pages) < 99999)
                                      .toList();
                                });
                              },
                              child: const Icon(
                                Ionicons.close,
                                size: 18,
                              ))
                        ],
                      )),
              selectedFilter == "null"
                  ? const SizedBox(
                      height: 0,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            alignment: Alignment.center,
                            height: 30,
                            width: selectedFilter == "null"
                                ? 50
                                : (selectedFilter.characters.length.toDouble() *
                                        5) +
                                    60,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor ==
                                            const Color(0xff1e1f20)
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  selectedFilter,
                                  textAlign: TextAlign.center,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Feedback.forTap(context);
                                      setState(() {
                                        selectedFilter = "null";
                                        widget.eList = widget.pertuk;
                                      });
                                    },
                                    child: const Icon(
                                      Ionicons.close,
                                      size: 18,
                                    ))
                              ],
                            )),
                      ],
                    ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                    height: 12,
                    color: Theme.of(context).scaffoldBackgroundColor ==
                            const Color(0xff1E1F20)
                        ? Colors.grey.shade800
                        : Colors.cyan,
                    thickness: 1,
                  ),
              itemCount: widget.eList.length,
              itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor ==
                                            const Color(0xff1E1F20)
                                        ? Colors.grey.shade500
                                        : Colors.cyan.shade600,
                                width: 4),
                            borderRadius: BorderRadius.circular(10)),
                        height: 127,
                        width: 127,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              widget.eList[index].thumb,
                              fit: BoxFit.fill,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.eList[index].bookname,
                              style: TextStyle(
                                  fontFamily: 'ir-sharp-m',
                                  overflow: TextOverflow.ellipsis,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.eList[index].name,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 38,
                                fontFamily: 'ir-sharp-m',
                              ),
                            ),
                            Text(
                              widget.eList[index].booktype,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 38,
                                fontFamily: 'ir-sharp-m',
                              ),
                            ),
                            Text(
                              "${toArabicNums(widget.eList[index].pages)} لاپەڕە",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 38,
                                fontFamily: 'ir-sharp-m',
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                    highlightColor: Colors.cyan.shade200,
                                    borderRadius: BorderRadius.circular(35),
                                    onTap: () async {
                                      try {
                                        if (Platform.isAndroid) {
                                          final AndroidIntent intent =
                                              AndroidIntent(
                                                  action: 'action_view',
                                                  data: widget
                                                      .eList[index].downlink,
                                                  package:
                                                      "com.android.chrome");
                                          await intent.launch();
                                        } else {
                                          final AndroidIntent intent =
                                              AndroidIntent(
                                            action: 'action_view',
                                            data: widget.eList[index].downlink,
                                            package:
                                                "com.sec.android.app.sbrowser",
                                          );
                                          await intent.launch();
                                        }
                                        if (Platform.isIOS) {
                                          var url =
                                              widget.eList[index].downlink;
                                          if (await canLaunchUrl(
                                              Uri.parse(url))) {
                                            await launchUrl(Uri.parse(url));
                                          }
                                        }
                                      } on Exception catch (e) {
                                        debugPrint("$e");
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Text(
                                                "کێشە هەیە لە وەرگرتنی زانیاری",
                                                style: TextStyle(
                                                    color: Color(0xfff7f7f7),
                                                    fontSize: 17),
                                                textAlign: TextAlign.center,
                                                softWrap: true,
                                              ),
                                              Icon(
                                                Ionicons
                                                    .information_circle_sharp,
                                                color: Color(0xfff7f7f7),
                                                size: 30,
                                              )
                                            ],
                                          ),
                                          backgroundColor: Theme.of(context)
                                                      .scaffoldBackgroundColor ==
                                                  const Color(0xff1E1F20)
                                              ? const Color.fromARGB(
                                                  255, 43, 43, 41)
                                              : const Color(0xff1E1F20),
                                          behavior: SnackBarBehavior.floating,
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 15.0, 0.0, 15.0),
                                          margin: const EdgeInsets.fromLTRB(
                                              5, 0, 5, 50),
                                          duration: const Duration(
                                              milliseconds: 1500),
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ));
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(12),
                                      width: 60,
                                      height: 60,
                                      decoration: containerDecorationData2,
                                      child: Theme.of(context)
                                                  .scaffoldBackgroundColor ==
                                              const Color(0xff1E1F20)
                                          ? Image.asset(
                                              "icons/cloud-dark.png",
                                              fit: BoxFit.fill,
                                            )
                                          : Image.asset(
                                              "icons/cloud.png",
                                              fit: BoxFit.fill,
                                            ),
                                    )),
                                InkWell(
                                    highlightColor: Colors.amber.shade200,
                                    borderRadius: BorderRadius.circular(35),
                                    onTap: () async {
                                      try {
                                        if (Platform.isAndroid) {
                                          final AndroidIntent intent =
                                              AndroidIntent(
                                                  action: 'action_view',
                                                  data: widget
                                                      .eList[index].viewlink,
                                                  package:
                                                      "com.android.chrome");
                                          await intent.launch();
                                        } else {
                                          final AndroidIntent intent =
                                              AndroidIntent(
                                            action: 'action_view',
                                            data: widget.eList[index].viewlink,
                                            package:
                                                "com.sec.android.app.sbrowser",
                                          );
                                          await intent.launch();
                                        }
                                        if (Platform.isIOS) {
                                          var url =
                                              widget.eList[index].viewlink;
                                          if (await canLaunchUrl(
                                              Uri.parse(url))) {
                                            await launchUrl(Uri.parse(url));
                                          }
                                        }
                                      } on Exception catch (e) {
                                        debugPrint("$e");
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              Text(
                                                "کێشە هەیە لە وەرگرتنی زانیاری",
                                                style: TextStyle(
                                                    color: Color(0xfff7f7f7),
                                                    fontSize: 17),
                                                textAlign: TextAlign.center,
                                                softWrap: true,
                                              ),
                                              Icon(
                                                Ionicons
                                                    .information_circle_sharp,
                                                color: Color(0xfff7f7f7),
                                                size: 30,
                                              )
                                            ],
                                          ),
                                          backgroundColor: Theme.of(context)
                                                      .scaffoldBackgroundColor ==
                                                  const Color(0xff1E1F20)
                                              ? const Color.fromARGB(
                                                  255, 43, 43, 41)
                                              : const Color(0xff1E1F20),
                                          behavior: SnackBarBehavior.floating,
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 15.0, 0.0, 15.0),
                                          margin: const EdgeInsets.fromLTRB(
                                              5, 0, 5, 50),
                                          duration: const Duration(
                                              milliseconds: 1500),
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ));
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(12),
                                      width: 60,
                                      height: 60,
                                      decoration: containerDecorationData2,
                                      child: Theme.of(context)
                                                  .scaffoldBackgroundColor ==
                                              const Color(0xff1E1F20)
                                          ? Image.asset(
                                              "icons/book-dark.png",
                                              fit: BoxFit.fill,
                                            )
                                          : Image.asset(
                                              "icons/book.png",
                                              fit: BoxFit.fill,
                                            ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
          widget.eList.length > 5
              ? Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 8.0),
                  child: InkWell(
                    splashColor: Theme.of(context).scaffoldBackgroundColor ==
                            const Color(0xff1E1F20)
                        ? const Color.fromARGB(255, 8, 37, 39)
                        : Colors.cyan.shade200,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () => scrollController.animateTo(-40,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear),
                    child: ListTile(
                      leading: const RotatedBox(
                          quarterTurns: 45,
                          child: Icon(Icons.arrow_back_ios_new)),
                      title: Text(
                        quotes[val],
                        style: TextStyle(
                            fontFamily: 'ir-sharp-m',
                            fontSize: MediaQuery.of(context).size.width / 30,
                            fontStyle: FontStyle.italic),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 10,
                )
        ],
      ),
    );
  }
}
