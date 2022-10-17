import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/appbar_sys_uioverlay.dart';
import '../components/sliver_container_decoration_data.dart';
import '../models/serchawakan_model.dart';

class Sources extends StatefulWidget {
  const Sources({super.key, required this.serchawe});
  final List<Serchawekan> serchawe;

  @override
  State<Sources> createState() => _SourcesState();
}

class _SourcesState extends State<Sources> {
  final String title = "سەرچاوەکانی فێربوون";

  refreshSourceData() {
    setState(() {
      getSerchawekan(http.Client());
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<Serchawekan>>(
        future: getSerchawekan(http.Client()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return RefreshIndicator(
              color: Colors.cyan,
              onRefresh: () => refreshSourceData(),
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
            return SourceData(serchawe: snapshot.data!);
          } else {
            return Center(
                child: SizedBox(
              height: 40,
              width: 40,
              child: Lottie.asset(
                "assets/loading.json",
                animate: true,
              ),
            ));
          }
        },
      ),
    );
  }
}

class SourceData extends StatefulWidget {
  const SourceData({super.key, required this.serchawe});
  final List<Serchawekan> serchawe;
  @override
  State<SourceData> createState() => _SourceDataState();
}

class _SourceDataState extends State<SourceData> {
  refreshSourceScreen() {
    setState(() {
      getSerchawekan(http.Client());
    });
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => refreshSourceScreen(),
        child: ListView(
            controller: scrollController,
            physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(
                        height: 12,
                        color: Theme.of(context).scaffoldBackgroundColor ==
                                const Color(0xff1E1F20)
                            ? Colors.grey.shade800
                            : Colors.cyan,
                        thickness: 1,
                      ),
                  itemCount: widget.serchawe.length,
                  itemBuilder: (context, index) => ExpansionTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        tilePadding: const EdgeInsets.all(8),
                        iconColor: Theme.of(context).backgroundColor ==
                                const Color(0xff1E1F20)
                            ? Colors.cyan.shade500
                            : Colors.cyan.shade800,
                        textColor: Theme.of(context).backgroundColor ==
                                const Color(0xff1E1F20)
                            ? Colors.cyan.shade800
                            : Colors.cyan.shade500,
                        title: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              widget.serchawe[index].reccommended == "yes"
                                  ? Icon(
                                      Ionicons.star_sharp,
                                      color: Colors.amber.shade600,
                                    )
                                  : const SizedBox(
                                      height: 0,
                                    ),
                              Text(
                                widget.serchawe[index].title,
                                softWrap: true,
                                style: const TextStyle(
                                    fontFamily: 'ir-sharp-m',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 10.0, 4),
                            child: Text(
                              widget.serchawe[index].description.toString(),
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 12, bottom: 5),
                                child: widget.serchawe[index].icon == "youtube"
                                    ? InkWell(
                                        onTap: () async {
                                          try {
                                            if (Platform.isAndroid) {
                                              final AndroidIntent intent =
                                                  AndroidIntent(
                                                      action: 'action_view',
                                                      data: widget
                                                          .serchawe[index].link,
                                                      package:
                                                          "com.google.android.youtube");
                                              await intent.launch();
                                            } else {
                                              final AndroidIntent intent =
                                                  AndroidIntent(
                                                action: 'action_view',
                                                data:
                                                    widget.serchawe[index].link,
                                                package: "com.android.chrome",
                                              );
                                              await intent.launch();
                                            }
                                            if (Platform.isIOS) {
                                              var url =
                                                  widget.serchawe[index].link;
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "کێشە هەیە لە وەرگرتنی زانیاری",
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xfff7f7f7),
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
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              margin: const EdgeInsets.fromLTRB(
                                                  5, 0, 5, 50),
                                              duration: const Duration(
                                                  milliseconds: 1500),
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ));
                                          }
                                        },
                                        highlightColor: Colors.red.shade600
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(35),
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
                                                  "icons/youtube-dark.png",
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.asset(
                                                  "icons/youtube.png",
                                                  fit: BoxFit.fill,
                                                ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () async {
                                          try {
                                            if (Platform.isAndroid) {
                                              final AndroidIntent intent =
                                                  AndroidIntent(
                                                      action: 'action_view',
                                                      data: widget
                                                          .serchawe[index].link,
                                                      package:
                                                          "com.android.chrome");
                                              await intent.launch();
                                            } else {
                                              final AndroidIntent intent =
                                                  AndroidIntent(
                                                action: 'action_view',
                                                data:
                                                    widget.serchawe[index].link,
                                                package:
                                                    "com.sec.android.app.sbrowser",
                                              );
                                              await intent.launch();
                                            }
                                            if (Platform.isIOS) {
                                              var url =
                                                  widget.serchawe[index].link;
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "کێشە هەیە لە وەرگرتنی زانیاری",
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xfff7f7f7),
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
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              margin: const EdgeInsets.fromLTRB(
                                                  5, 0, 5, 50),
                                              duration: const Duration(
                                                  milliseconds: 1500),
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ));
                                          }
                                        },
                                        highlightColor: Colors
                                            .lightBlue.shade400
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(35),
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
                                                  "icons/globe-dark.png",
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.asset(
                                                  "icons/globe.png",
                                                  fit: BoxFit.fill,
                                                ),
                                        ),
                                      ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  "لێرەوە سەردانی پێگەی ئەلیکتڕۆنیان بکەن:",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'ir-sharp-m',
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      )),
              widget.serchawe.length > 10
                  ? InkWell(
                      splashColor: Colors.cyan.shade100,
                      splashFactory: InkRipple.splashFactory,
                      onTap: () => scrollController.animateTo(-40,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear),
                      child: const ListTile(
                        leading: RotatedBox(
                            quarterTurns: 45,
                            child: Icon(Icons.arrow_back_ios_new)),
                      ),
                    )
                  : const SizedBox(
                      height: 10,
                    )
            ]));
  }
}
