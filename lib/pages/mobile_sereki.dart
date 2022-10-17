import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../components/appbar_sys_uioverlay.dart';
import '../components/sliver_container_decoration_data.dart';
import '../main.dart';
import 'about_me.dart';
import 'about_school.dart';
import 'mobile_album.dart';
import 'mobile_lib.dart';
import 'mobile_sources.dart';

class MobileSereki extends StatefulWidget {
  const MobileSereki({super.key});

  @override
  State<MobileSereki> createState() => _MobileSerekiState();
}

class _MobileSerekiState extends State<MobileSereki> {
  var ctime;

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (ctime == null || now.difference(ctime) > const Duration(seconds: 2)) {
      //add duration of press gap
      ctime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "بۆ دەرچوون دووجار لێبدە",
              style: TextStyle(
                  color: Color(0xfff7f7f7),
                  fontSize: MediaQuery.of(context).size.width / 25),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            Icon(
              Ionicons.exit_outline,
              color: Colors.red.shade700,
              size: 30,
            )
          ],
        ),
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor == const Color(0xff1E1F20)
                ? const Color.fromARGB(255, 43, 43, 41)
                : const Color(0xff1E1F20),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
        margin: const EdgeInsets.fromLTRB(35, 0, 35, 50),
        duration: const Duration(milliseconds: 1500),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      )); //scaffold message, you can show Toast message too.
      return Future.value(false);
    }

    return Future.value(true);
  }

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

  final month = (DateTime.now().month).toString();
  final day = (DateTime.now().day).toString();
  late String today = "$month/$day";
  var kYear = (DateTime.now().year + 700).toString();

  double top = 0.0;
  @override
  Widget build(BuildContext context) {
    String title = "سه‌ره‌کی";
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: CustomScrollView(
          physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              stretch: true,
              pinned: true,
              scrolledUnderElevation: 20,
              expandedHeight: 190,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    background: AnimatedOpacity(
                      opacity: top ==
                              MediaQuery.of(context).padding.top +
                                  kToolbarHeight
                          ? 0.0
                          : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Theme.of(context).scaffoldBackgroundColor ==
                              const Color(0xff1E1F20)
                          ? Image.asset("assets/school-logo-dark.png")
                          : Image.asset("assets/school-logo.png"),
                    ),
                    centerTitle: true,
                    title: AnimatedOpacity(
                      opacity: top ==
                              MediaQuery.of(context).padding.top +
                                  kToolbarHeight
                          ? 1.0
                          : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        title,
                        style: Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xff1E1F20)
                            ? appbarTitleDataDark
                            : appbarTitleData,
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  today == '3/20'
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                              height: 65,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                                .scaffoldBackgroundColor ==
                                            const Color(0xff1e1f20)
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Ionicons.bonfire_outline,
                                      color: Colors.red.shade600,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'نەورۆزی ${toArabicNums(kYear)} پیرۆز',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                                      .scaffoldBackgroundColor ==
                                                  const Color(0xff1e1f20)
                                              ? const Color(0xfff7f7f7)
                                              : const Color(0xff1e1f20),
                                          fontFamily: 'ir-sharp-m',
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              )))
                      : const SizedBox(),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: 160,
                      child: GestureDetector(
                        onTap: () {
                          Feedback.forTap(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((context) => const Lib())),
                              (route) => (true));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(right: 25),
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 90,
                            decoration:
                                Theme.of(context).scaffoldBackgroundColor ==
                                        const Color(0xff1E1F20)
                                    ? containerDecorationDataDark
                                    : containerDecorationData,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(12),
                                    width: 90,
                                    height: 90,
                                    decoration: containerDecorationData2,
                                    child: Theme.of(context)
                                                .scaffoldBackgroundColor ==
                                            const Color(0xff1E1F20)
                                        ? Image.asset("icons/lib-dark.png")
                                        : Image.asset(
                                            "icons/lib.png",
                                          ),
                                  ),
                                ),
                                Text(
                                  "په‌رتوکخانه‌",
                                  style: TextStyle(
                                      fontFamily: "IBMPlexSansArabic",
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: 160,
                      child: GestureDetector(
                        onTap: () {
                          Feedback.forTap(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((context) => const Sources(
                                        serchawe: [],
                                      ))),
                              (route) => (true));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(right: 25),
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 90,
                            decoration:
                                Theme.of(context).scaffoldBackgroundColor ==
                                        const Color(0xff1E1F20)
                                    ? containerDecorationDataDark
                                    : containerDecorationData,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(12),
                                    width: 90,
                                    height: 90,
                                    decoration: containerDecorationData2,
                                    child: Theme.of(context)
                                                .scaffoldBackgroundColor ==
                                            const Color(0xff1E1F20)
                                        ? Image.asset("icons/sourcing-dark.png")
                                        : Image.asset(
                                            "icons/sourcing.png",
                                          ),
                                  ),
                                ),
                                Text(
                                  "سه‌رچاوەکانی فێربوون",
                                  style: TextStyle(
                                      fontFamily: "IBMPlexSansArabic",
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 35,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10, right: 10),
                  //   child: SizedBox(
                  //     height: 160,
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         Feedback.forTap(context);
                  //         Navigator.of(context).pushAndRemoveUntil(
                  //             MaterialPageRoute(
                  //                 builder: (context) => const TestPage()),
                  //             (route) => true);
                  //       },
                  //       child: Container(
                  //           padding: const EdgeInsets.only(right: 25),
                  //           alignment: Alignment.centerRight,
                  //           width: MediaQuery.of(context).size.width - 40,
                  //           height: 90,
                  //           decoration:
                  //               Theme.of(context).scaffoldBackgroundColor ==
                  //                       const Color(0xff1E1F20)
                  //                   ? containerDecorationDataDark
                  //                   : containerDecorationData,
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: <Widget>[
                  //               Padding(
                  //                 padding: const EdgeInsets.only(left: 15),
                  //                 child: Container(
                  //                   alignment: Alignment.center,
                  //                   padding: const EdgeInsets.all(12),
                  //                   width: 90,
                  //                   height: 90,
                  //                   decoration: containerDecorationData2,
                  //                   child: Theme.of(context)
                  //                               .scaffoldBackgroundColor ==
                  //                           const Color(0xff1E1F20)
                  //                       ? Image.asset("icons/testPage-dark.png")
                  //                       : Image.asset(
                  //                           "icons/testPage.png",
                  //                         ),
                  //                 ),
                  //               ),
                  //               Text(
                  //                 "تاقیکردنه‌وە",
                  //                 style: sliverTextStyle,
                  //               ),
                  //             ],
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: 160,
                      child: GestureDetector(
                        onTap: () {
                          Feedback.forTap(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((context) => const Album())),
                              (route) => (true));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(right: 25),
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 90,
                            decoration:
                                Theme.of(context).scaffoldBackgroundColor ==
                                        const Color(0xff1E1F20)
                                    ? containerDecorationDataDark
                                    : containerDecorationData,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(12),
                                    width: 90,
                                    height: 90,
                                    decoration: containerDecorationData2,
                                    child: Theme.of(context)
                                                .scaffoldBackgroundColor ==
                                            const Color(0xff1E1F20)
                                        ? Image.asset("icons/camera-dark.png")
                                        : Image.asset(
                                            "icons/camera.png",
                                          ),
                                  ),
                                ),
                                Text(
                                  "ئه‌لبومه‌که‌مان",
                                  style: TextStyle(
                                      fontFamily: "IBMPlexSansArabic",
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: 160,
                      child: GestureDetector(
                        onTap: () {
                          Feedback.forTap(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((context) => const AboutSchool())),
                              (route) => (true));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(right: 25),
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 90,
                            decoration:
                                Theme.of(context).scaffoldBackgroundColor ==
                                        const Color(0xff1E1F20)
                                    ? containerDecorationDataDark
                                    : containerDecorationData,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(12),
                                    width: 90,
                                    height: 90,
                                    decoration: containerDecorationData2,
                                    child: Theme.of(context)
                                                .scaffoldBackgroundColor ==
                                            const Color(0xff1E1F20)
                                        ? Image.asset("icons/school-dark.png")
                                        : Image.asset(
                                            "icons/school.png",
                                          ),
                                  ),
                                ),
                                Text(
                                  "ده‌رباره‌ی قوتابخانه‌که‌مان",
                                  style: TextStyle(
                                      fontFamily: "IBMPlexSansArabic",
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: 160,
                      child: GestureDetector(
                        onTap: () {
                          Feedback.forTap(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((context) => const AboutMe())),
                              (route) => (true));
                        },
                        child: Container(
                            padding: const EdgeInsets.only(right: 25),
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width - 40,
                            height: 90,
                            decoration:
                                Theme.of(context).scaffoldBackgroundColor ==
                                        const Color(0xff1E1F20)
                                    ? containerDecorationDataDark
                                    : containerDecorationData,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(12),
                                    width: 90,
                                    height: 90,
                                    decoration: containerDecorationData2,
                                    child: Theme.of(context)
                                                .scaffoldBackgroundColor ==
                                            const Color(0xff1E1F20)
                                        ? Image.asset("icons/code-dark.png")
                                        : Image.asset(
                                            "icons/code.png",
                                          ),
                                  ),
                                ),
                                Text(
                                  "ده‌رباره‌ی به‌رنامه‌",
                                  style: TextStyle(
                                      fontFamily: "IBMPlexSansArabic",
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "گۆڕینی دۆخ",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 23,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'ir-sharp-m',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color:
                                  Theme.of(context).scaffoldBackgroundColor ==
                                          const Color(0xfff7f7f7)
                                      ? Colors.grey.shade200
                                      : Colors.cyanAccent.shade100),
                          child: IconButton(
                              icon: Theme.of(context).scaffoldBackgroundColor ==
                                      const Color(0xfff7f7f7)
                                  ? Icon(
                                      Ionicons.sunny,
                                      size: 30,
                                      color: Colors.amber.shade600,
                                    )
                                  : const Icon(
                                      Ionicons.moon,
                                      size: 30,
                                      color: Colors.deepPurple,
                                    ),
                              onPressed: () {
                                currentTheme.switcher();
                              }),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide.none,
                          top: BorderSide.none,
                          right: BorderSide.none,
                          bottom: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor ==
                                    const Color(0xff1E1F20)
                                ? const Color(0xfff7f7f7)
                                : const Color(0xff1E1F20),
                          )),
                    ),
                    child: Text(
                      "دامه‌زراوه‌©  ٢٠٢٢",
                      style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: MediaQuery.of(context).size.width / 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
