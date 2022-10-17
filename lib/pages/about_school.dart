import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/appbar_sys_uioverlay.dart';

class AboutSchool extends StatelessWidget {
  const AboutSchool({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "ده‌رباره‌ی قوتابخانه‌که‌مان";
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
            child: Theme.of(context).scaffoldBackgroundColor ==
                    const Color(0xff1e1f20)
                ? Image.asset('assets/school-logo-dark.png')
                : Image.asset('assets/school-logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '''کورتەباسێک لەسەر قوتابخانەکەمان''',
              style: TextStyle(
                fontFamily: 'ir-sharp-m',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor ==
                        const Color(0xff1E1F20)
                    ? Colors.cyan.shade500
                    : Colors.cyan.shade800,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              '''قوتابخانەی (ئیروان ساکا)ـی بنەڕەتی تێکەڵاو دەکەوێتە سنوری بەڕێوەبەرایەتی پەروەردەی مێرگەسۆر لە ناحیەی بارزان (بەری نزار) لە ساڵی (١٩٩٧) زاینی دروستکراوە ، واتە ماوەی بیست و پێنج ساڵە ئەم قوتابخانەیە دامەزراوە ، یەکێکە لە قوتابخانە دیارەکانی سنوری بەڕێوەبەرایەتی پەروەردەی مێرگەسۆر. بە پێی ڕێنماییەکانی وەزارەتی پەروەردە کاردەکات و پڕۆگرامەکانی خوێندن بە زمانی کوردییە ، وانەکانی کوردی و ئینگلیزی و عەرەبی لێ دەخوێندرێت. خوێندن لە قوتابخانەکەمان جگە لە پێوەری نمرە و تاقیکردنەوەی ئاستی لەسەر هیچ بنەمایەکی تری وەک (ڕەنگی جیاواز ، نەتەوەی جیاواز ، دینی جیاواز) دانانرێت، هەروەها ساڵانە چەندین قوتابی ئاست بەرزمان خەڵات دەکرێن لە لایەن قوتابخانەوە و چەندین ڕێزوسوپاسی بەڕێوەبەرایەتی پەروەردەی مێرگەسۆر و جەنابی وەزیرمان پی بەخشراوە. لە سەرەتای دامەزراندنیەوە تا وەکو ئێستا ژمارەیەکی زۆر لە قوتابیمان پێگەیاندووە و گەیشتوونە بە ئامانجی دیاریکراوی خۆیان ، بۆ خزمەتکردنی وڵاتەکەمان کە هەندێکیان لە ئێستادا مامۆستان و خزمەت دەکەن لە قوتابخانەکەی خۆیان و دەرەوەی ئەم قوتابخانەیە. ڕێژەی قوتابیان لە قوتابخانەکەمان ساڵانە لە بەرزبوونەوە دایە و لە ئێستادا نزیکەی (١٥٠) قوتابیمان هەیە. قوتابخانەکەمان لە ڕیزی قوتابخانە ستانداردەکانە ئەمەش لە سایەی کۆمەڵێک مامۆستای بە ئەزموون و چالاک و کورد پەروەرە کە درێخیان نەکردووە لە خزمەت کردنی قوتابی و قوتابخانە . بەشێکی زۆر لە سەرپەرشتیاران و کەسانی پەروەردەیی رۆلی مامۆستایان بەرز نرخاندووە، هیوای بەردەوامییان بۆ خواستوونە.''',
              style: TextStyle(
                height: 1.8,
                fontFamily: 'ir-sharp-m',
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
              textHeightBehavior: TextHeightBehavior(
                  leadingDistribution: TextLeadingDistribution.even,
                  applyHeightToFirstAscent: true,
                  applyHeightToLastDescent: true),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '''چالاکیە دیارەکانی قوتابخانەکەمان''',
              style: TextStyle(
                fontFamily: 'ir-sharp-m',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor ==
                        const Color(0xff1E1F20)
                    ? Colors.cyan.shade500
                    : Colors.cyan.shade800,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Text(
              '''١. سەردانی بەڕێوەبەر بۆ گشت مامۆستایان ٢ تا ٣ جار بۆ بینینی چۆنیەتی بەڕێوەچوونی کاری مامۆستایان هەروەها هەڵسەنگاندنی مامۆستایان وە سەردانی هاوڕێی ڕەخنەگر بۆ مامۆستایان و بۆ زیاتر بەرەوپێشبردنییان. 
٢. بە پێی بارودۆخ و کاتی پێویست بەڕێوەبەر کۆبونەوەیەکی بەرفراوان لەگەڵ دەستەی مامۆستایان ئەنجام دەدات بۆ گفتوگۆکردن لەسەر ڕەوتی خوێندن و ئاستی زانستی قوتابیان لە قوتابخانە ، وەرگرتنی ڕا و سەرەنجی گشتی بۆ بەرزکردنەوەی ئاستی زانستی قوتابی. 
٣. لە سەرەتای مانگی (١١) لە دوای دەستپێکردنی خوێدن هەر مامۆستایەک بە پێی پسپۆری خۆی خود هەڵسەنگاندن ئەنجام دەدات ئەنجام دەدات بۆ دیاری کردنی ئاستی خۆی بەپێی ستانداردەکان.
٤. بەڕێوەبەر و مامۆستایان وەرزی جارێک کۆبونەوە لەگەڵ دایبابان ئەنجام دەدەن بۆ ئەوەی لە نزیکەوە بەخێوکاری قوتابیان ئاگاداری بارودۆخی منداڵەکەی بێت وە گوێ لە بیر و بۆچوونەکانی یەکتر بگرن.
٥. بانگێشتکردنی بەخێوکاری قوتابی بۆ ئاگادارکردنەوەیان ئەگەر قوتابی لە بابەتەکانی لاواز بێت یان خالی نەرێنی هەبێت. 
٦. ئاگادارکردنەوەی بەخێوکاری قوتابی دوای ئەنجامدانی تاقیکردنەوەی وەرزی یەکەم لە لایەن دەستەی کارگێڕی لە بارەی دەرنەچوونی قوتابی بەدواداچوون لە هۆکاری کەوتنی لە وانەکای و هەڵدان بۆ چارەسەرکردنی.
٧. دانانی پلانێک بۆ بەرزکردنەوەی ئاستی زانستی قوتابیان بە هاوکاری مامۆستایان و سود وەرگرتن لە ڕێنمای هاوڕێی ڕەخنەگری قوتابخانە.
٨. خەلات کردنی قوتابییە سەرکەوتووەکان لە لایەن بەڕێوەبەر و دەستەی مامۆستایانەوە.
٩. ئەنجامدانی سەردان گۆڕکێ لە نێوان مامۆستاکان بە ئامانجی سود وەرگرتن لە ئەزموونی وانە ووتنەوە و ئاشنابوون بە شیوازی گەیاندنی بابەتەکان بە قوتابیان.
''',
              style: TextStyle(
                height: 1.8,
                fontFamily: 'ir-sharp-m',
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                          data:
                              'https://www.facebook.com/profile.php?id=100042283653064',
                          package: "com.android.chrome");
                      await intent.launch();
                    } else {
                      const AndroidIntent intent = AndroidIntent(
                        action: 'action_view',
                        data:
                            'https://www.facebook.com/profile.php?id=100042283653064',
                        package: "com.sec.android.app.sbrowser",
                      );
                      await intent.launch();
                    }
                    if (Platform.isIOS) {
                      var url =
                          'https://www.facebook.com/profile.php?id=100042283653064';
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
                            style: TextStyle(
                                color: Color(0xfff7f7f7), fontSize: 17),
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
                width: 200,
                alignment: Alignment.center,
                child: Text(
                  'کاروچالاکیەکانمان لێرە ببینە',
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
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
