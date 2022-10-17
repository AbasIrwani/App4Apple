import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/appbar_sys_uioverlay.dart';
import '../components/termsandprivacy.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with SingleTickerProviderStateMixin {
  late final AnimationController lottieController;
  @override
  void initState() {
    super.initState();
    lottieController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    String title = "ده‌رباره‌ی به‌رنامه‌";
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
          leading: Row(children: [
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
                ))
          ])),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                if (tapped == false) {
                  tapped = true;
                  lottieController.forward();
                } else {
                  tapped = false;
                  lottieController.reverse();
                }
              },
              child: LottieBuilder.asset(
                'icons/damazrawa-logo-animation.json',
                width: 250,
                height: 250,
                animate: false,
                controller: lottieController,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              '''لەگەڵ هیوای سەرکەوتن و لەشساغیتان، ئەم بەرنامەیە دیاری پێگەی دامەزراوەیە بۆ قوتابخانەی ئیروان ساکای هاوڕێی بنەڕەتی و قوتابیانی چوار پارچەمان. ئەمڕۆ ٢٠٢٢/٩/٩ دوای نزیکەی چوار مانگ هەست دەکەم ئەم بەرنامەیە بەبێ ئەوەی بێ بەش بێت لە کێماسی نزیکە لەوەی ببێتە نمونەیەکی ئامادە بۆ بەردەستی قوتابیان. لە دروستکردنی ئەم بەرنامەیە چەند هیوا و ئامانجێکم هەبوو ئەوانەش  بەم شێوەیەن. بە ناو و ئەلبومەکەی هیوام وایە ناوێکم بۆ قوتابخانەکەی خۆم، قوتابخانەی ئیروان ساکا، دروستکردبێت  کە ببێتە جێی دڵخۆشی قوتابیانی هەردوو گوندەکە. بە پەرتوکخانە و پەڕەی سەرچاوەکانی هیوام وایە بتوانم و توانیمبێت سودێک بە قوتابیانمان بگەیێنم و ڕێگای دەستکەوتنی زانین و زانستم ئاسانتر کردبێت گەر بە تۆزقالێکیش بێت. مامۆستا بەرهەم تارق عبداللە ناوێک کە پێویستە بۆ هەمیشە لای هەردوو گوندی ئیروان و ساکا بە زیندووی بمێنێتەوە. من سوپاسی دەکەم بۆ هەوڵ و ماندوونی بەردەوامی بۆ بەرەوپێشبردنی قوتابخانە ئەمساڵی خوێندنی ٢٠٢٢-٢٠٢٣ قوتابخانەکەمان بە ناوی (هاوڕێ)ـوە دەست دەکات بە خوێندن. مامۆستا و بەڕێوەبەرێکی نمونە لە دڵسۆزی خوای گەورە لە دواڕۆژدا سەرکەوتنی گەورەترت بە قسمەت بکات. هەروەها دەمەوێت سوپاسی دەزگای ڕوانگە بکەم کە ڕێگەدەدەن پەرتوکەکانیان بڵاوبکرێنەوە ئامانجێکی هاوئاهەنگیان هەیە لە بڵاوکردنەوەی خوێندنەوە و زانیندا.هەڵبەت ئەم ئارامییەی ئەمڕۆمان لە سایەی خەبات و تێکۆشانێکی لەبیرنەکراوە بۆ دۆزێکی پیرۆز. بەئیزنی خوا ئێمەش بە پێنوس درێژەپێدەری ئەو ڕێبازە پیرۆزە دەبین و لە تێکۆشان ناوەستین، لەگەڵ هیوای سەرکەوتن و لەشساغیتان. \n -ع.م.و''',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                height: 1.8,
                fontSize: 17,
                fontFamily: 'ir-sharp-m',
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                        toolbarHeight: 150,
                        scrolledUnderElevation: 20,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(
                          'سیاسه‌تی کەسی',
                          style: Theme.of(context).scaffoldBackgroundColor ==
                                  const Color(0xff1E1F20)
                              ? appbarTitleDataDark
                              : appbarTitleData,
                        ),
                        leading: Row(children: [
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor ==
                                            const Color(0xff1E1F20)
                                        ? Colors.cyan.shade500
                                        : Colors.cyan.shade800,
                                size: 35,
                              ))
                        ])),
                    body: ListView(
                      physics:
                          const ScrollPhysics(parent: BouncingScrollPhysics()),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(privacy),
                        ),
                      ],
                    ),
                  ),
                ),
                child: Container(
                  width: 150,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    'سیاسەتی کەسی',
                    style: TextStyle(
                      fontFamily: 'ir-sharp-m',
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                        toolbarHeight: 150,
                        scrolledUnderElevation: 20,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(
                          'هەل و مەرجەکان',
                          style: Theme.of(context).scaffoldBackgroundColor ==
                                  const Color(0xff1E1F20)
                              ? appbarTitleDataDark
                              : appbarTitleData,
                        ),
                        leading: Row(children: [
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor ==
                                            const Color(0xff1E1F20)
                                        ? Colors.cyan.shade500
                                        : Colors.cyan.shade800,
                                size: 35,
                              ))
                        ])),
                    body: ListView(
                      physics:
                          const ScrollPhysics(parent: BouncingScrollPhysics()),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(terms),
                        ),
                      ],
                    ),
                  ),
                ),
                child: Container(
                  width: 150,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    'هەل و مەرجەکان',
                    style: TextStyle(
                      fontFamily: 'ir-sharp-m',
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              icon: Icon(
                Ionicons.globe_outline,
                color: Theme.of(context).scaffoldBackgroundColor ==
                        const Color(0xff1E1F20)
                    ? Colors.grey.shade300
                    : Colors.grey.shade700,
              ),
              onPressed: () async {
                try {
                  if (Platform.isAndroid) {
                    const AndroidIntent intent = AndroidIntent(
                        action: 'action_view',
                        data: 'https://abasirwani.wixsite.com/damazrawa',
                        package: "com.android.chrome");
                    await intent.launch();
                  } else {
                    const AndroidIntent intent = AndroidIntent(
                      action: 'action_view',
                      data: 'https://abasirwani.wixsite.com/damazrawa',
                      package: "com.sec.android.app.sbrowser",
                    );
                    await intent.launch();
                  }
                  if (Platform.isIOS) {
                    var url = 'https://abasirwani.wixsite.com/damazrawa';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    }
                  }
                } on Exception catch (e) {
                  debugPrint("$e");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "کێشە هەیە لە وەرگرتنی زانیاری",
                          style:
                              TextStyle(color: Color(0xfff7f7f7), fontSize: 17),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        Icon(
                          Ionicons.information_circle_sharp,
                          color: Color(0xfff7f7f7),
                          size: 30,
                        )
                      ],
                    ),
                    backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xff1E1F20)
                            ? const Color.fromARGB(255, 43, 43, 41)
                            : const Color(0xff1E1F20),
                    behavior: SnackBarBehavior.floating,
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                    duration: const Duration(milliseconds: 1500),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ));
                }
              },
            ),
            IconButton(
              icon: Icon(
                Ionicons.logo_facebook,
                color: Theme.of(context).scaffoldBackgroundColor ==
                        const Color(0xff1E1F20)
                    ? Colors.grey.shade300
                    : Colors.grey.shade700,
              ),
              onPressed: () async {
                try {
                  if (Platform.isAndroid) {
                    const AndroidIntent intent = AndroidIntent(
                        action: 'action_view',
                        data: 'https://www.facebook.com/Damazrawa.inc',
                        package: "com.android.chrome");
                    await intent.launch();
                  } else {
                    const AndroidIntent intent = AndroidIntent(
                      action: 'action_view',
                      data: 'https://www.facebook.com/Damazrawa.inc',
                      package: "com.sec.android.app.sbrowser",
                    );
                    await intent.launch();
                  }
                  if (Platform.isIOS) {
                    var url = 'https://www.facebook.com/Damazrawa.inc';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    }
                  }
                } on Exception catch (e) {
                  debugPrint("$e");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "کێشە هەیە لە وەرگرتنی زانیاری",
                          style:
                              TextStyle(color: Color(0xfff7f7f7), fontSize: 17),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        Icon(
                          Ionicons.information_circle_sharp,
                          color: Color(0xfff7f7f7),
                          size: 30,
                        )
                      ],
                    ),
                    backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xff1E1F20)
                            ? const Color.fromARGB(255, 43, 43, 41)
                            : const Color(0xff1E1F20),
                    behavior: SnackBarBehavior.floating,
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                    duration: const Duration(milliseconds: 1500),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ));
                }
              },
            ),
            IconButton(
              icon: Icon(
                Ionicons.logo_instagram,
                color: Theme.of(context).scaffoldBackgroundColor ==
                        const Color(0xff1E1F20)
                    ? Colors.grey.shade300
                    : Colors.grey.shade700,
              ),
              onPressed: () async {
                try {
                  if (Platform.isAndroid) {
                    const AndroidIntent intent = AndroidIntent(
                        action: 'action_view',
                        data: 'https://www.instagram.com/damazrawa/',
                        package: "com.android.chrome");
                    await intent.launch();
                  } else {
                    const AndroidIntent intent = AndroidIntent(
                      action: 'action_view',
                      data: 'https://www.instagram.com/damazrawa/',
                      package: "com.sec.android.app.sbrowser",
                    );
                    await intent.launch();
                  }
                  if (Platform.isIOS) {
                    var url = 'https://www.instagram.com/damazrawa/';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    }
                  }
                } on Exception catch (e) {
                  debugPrint("$e");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "کێشە هەیە لە وەرگرتنی زانیاری",
                          style:
                              TextStyle(color: Color(0xfff7f7f7), fontSize: 17),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        Icon(
                          Ionicons.information_circle_sharp,
                          color: Color(0xfff7f7f7),
                          size: 30,
                        )
                      ],
                    ),
                    backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xff1E1F20)
                            ? const Color.fromARGB(255, 43, 43, 41)
                            : const Color(0xff1E1F20),
                    behavior: SnackBarBehavior.floating,
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                    duration: const Duration(milliseconds: 1500),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ));
                }
              },
            ),
            Container(
              width: 150,
              alignment: Alignment.center,
              child: Text(
                'په‌یوەندیمان پێوە بکە',
                style: TextStyle(
                  fontFamily: 'ir-sharp-m',
                  fontSize: 15,
                  color: Theme.of(context).scaffoldBackgroundColor ==
                          const Color(0xff1E1F20)
                      ? Colors.grey.shade300
                      : Colors.grey.shade700,
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 50,
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
    );
  }
}
