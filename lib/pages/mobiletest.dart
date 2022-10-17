// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:ionicons/ionicons.dart';
// import 'package:irwansaka/components/nextButton.dart';
// import 'package:lottie/lottie.dart';
//
// import '../components/appbar_sys_uioverlay.dart';
// import '../components/nextButtonV2.dart';
// import '../models/test/zanyari_gshti_model.dart';
//
// class TestPage extends StatefulWidget {
//   const TestPage({super.key});
//
//   @override
//   State<TestPage> createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
//   late final AnimationController animationController;
//   late final AnimationController animationController1;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 600));
//     animationController.forward();
//     animationController1 = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 600));
//     animationController1.forward();
//   }
//
//   @override
//   void dispose() {
//     animationController.dispose();
//     animationController1.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String title = "تاقیکردنه‌وە";
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: 90,
//         scrolledUnderElevation: 20,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           title,
//           style: Theme.of(context).scaffoldBackgroundColor ==
//                   const Color(0xff1E1F20)
//               ? appbarTitleDataDark
//               : appbarTitleData,
//         ),
//         leading: Row(
//           children: [
//             const SizedBox(
//               width: 8,
//             ),
//             IconButton(
//                 splashRadius: 25,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: Icon(
//                   CupertinoIcons.back,
//                   color: Theme.of(context).scaffoldBackgroundColor ==
//                           const Color(0xff1E1F20)
//                       ? Colors.cyan.shade500
//                       : Colors.cyan.shade800,
//                   size: 35,
//                 )),
//           ],
//         ),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
//         children: [
//           const SizedBox(
//             height: 40,
//           ),
//           SlideTransition(
//             position:
//                 Tween<Offset>(begin: const Offset(0, 3.0), end: Offset.zero)
//                     .animate(CurvedAnimation(
//                         parent: animationController,
//                         curve: Curves.elasticInOut)),
//             child: FadeTransition(
//               opacity: Tween(begin: 0.0, end: 1.0).animate(animationController),
//               child: Center(
//                 child: Text(
//                   'بەخێربێیت',
//                   style: TextStyle(
//                       fontFamily: 'ir-sharp-m',
//                       fontSize: 28,
//                       color: Theme.of(context).scaffoldBackgroundColor ==
//                               const Color(0xff1E1F20)
//                           ? const Color(0xfff7f7f7)
//                           : const Color(0xff1E1F20)),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           SlideTransition(
//             position:
//                 Tween<Offset>(begin: const Offset(0, 3.0), end: Offset.zero)
//                     .animate(CurvedAnimation(
//                         parent: animationController1,
//                         curve: Curves.elasticInOut)),
//             child: FadeTransition(
//               opacity:
//                   Tween(begin: 0.0, end: 1.0).animate(animationController1),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Center(
//                   child: Text(
//                     'فێرخوازی ئازیز دەتوانیت لێرە هەڵسەنگاند بکەیت و ئاستی زانینی خۆت تاقیبکەیتەوە',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontFamily: 'ir-sharp-m',
//                         fontSize: 18,
//                         color: Theme.of(context).scaffoldBackgroundColor ==
//                                 const Color(0xff1E1F20)
//                             ? const Color(0xfff7f7f7)
//                             : const Color(0xff1E1F20)),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           SlideTransition(
//             position:
//                 Tween<Offset>(begin: const Offset(0, 3.0), end: Offset.zero)
//                     .animate(CurvedAnimation(
//                         parent: animationController1,
//                         curve: Curves.elasticInOut)),
//             child: FadeTransition(
//                 opacity:
//                     Tween(begin: 0.0, end: 1.0).animate(animationController1),
//                 child: Container(
//                     padding: const EdgeInsets.only(left: 20),
//                     alignment: Alignment.center,
//                     width: 200,
//                     height: 200,
//                     child: Theme.of(context).scaffoldBackgroundColor ==
//                             const Color(0xff1e1f20)
//                         ? Image.asset("icons/testPage-dark.png")
//                         : Image.asset("icons/testPage.png"))),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           SlideTransition(
//             position:
//                 Tween<Offset>(begin: const Offset(0, 3.0), end: Offset.zero)
//                     .animate(CurvedAnimation(
//                         parent: animationController1,
//                         curve: Curves.elasticInOut)),
//             child: FadeTransition(
//               opacity:
//                   Tween(begin: 0.0, end: 1.0).animate(animationController1),
//               child: Text(
//                 'دەست بکەین بە تاقیکردنەوە؟',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontFamily: 'ir-sharp-m',
//                     fontSize: 18,
//                     color: Theme.of(context).scaffoldBackgroundColor ==
//                             const Color(0xff1E1F20)
//                         ? const Color(0xfff7f7f7)
//                         : const Color(0xff1E1F20)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           SlideTransition(
//             position:
//                 Tween<Offset>(begin: const Offset(0, 3.0), end: Offset.zero)
//                     .animate(CurvedAnimation(
//                         parent: animationController1,
//                         curve: Curves.elasticInOut)),
//             child: FadeTransition(
//                 opacity:
//                     Tween(begin: 0.0, end: 1.0).animate(animationController1),
//                 child: Center(
//                     child: nxtButton(
//                   text: 'به‌ڵێ',
//                   func: () => Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(
//                           builder: (context) => const TestPagePaths(
//                                 zanyari: [],
//                               )),
//                       (route) => true),
//                 ))),
//           ),
//         ],
//       ),
//     );
//   }
//
//   String toArabicNums(String arabicinput) {
//     const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
//     const arabic = [
//       '٠',
//       '١',
//       '٢',
//       '٣',
//       '٤',
//       '٥',
//       '٦',
//       '٧',
//       '٨',
//       '٩',
//     ];
//
//     for (int i = 0; i < english.length; i++) {
//       arabicinput = arabicinput.replaceAll(english[i], arabic[i]);
//     }
//
//     return arabicinput;
//   }
// }
//
// class TestPagePaths extends StatefulWidget {
//   const TestPagePaths({super.key, required List zanyari});
//   @override
//   State<TestPagePaths> createState() => _TestPagePathsState();
// }
//
// class _TestPagePathsState extends State<TestPagePaths>
//     with TickerProviderStateMixin {
//   late final AnimationController animationController2;
//
//   final pagecontroller = PageController(initialPage: 0);
//   final pagecontroller2 = PageController(initialPage: 0);
//
//   @override
//   void initState() {
//     super.initState();
//     animationController2 = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 600));
//     animationController2.forward();
//   }
//
//   @override
//   void dispose() {
//     animationController2.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       reverse: true,
//       physics:
//           const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
//       controller: pagecontroller,
//       children: [
//         Scaffold(
//           body: SlideTransition(
//             position:
//                 Tween<Offset>(begin: const Offset(0, 3.0), end: Offset.zero)
//                     .animate(CurvedAnimation(
//                         parent: animationController2,
//                         curve: Curves.elasticInOut)),
//             child: FadeTransition(
//               opacity:
//                   Tween(begin: 0.0, end: 1.0).animate(animationController2),
//               child: ListView(
//                 physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
//                 children: [
//                   const SizedBox(
//                     height: 150,
//                   ),
//                   Center(
//                     child: Text(
//                       'چ جۆرە تاقیکردنەوەیەک بکەین؟',
//                       style: TextStyle(
//                           fontFamily: 'ir-sharp-m',
//                           fontSize: 18,
//                           color: Theme.of(context).scaffoldBackgroundColor ==
//                                   const Color(0xff1E1F20)
//                               ? const Color(0xfff7f7f7)
//                               : const Color(0xff1E1F20)),
//                     ),
//                   ),
//                   const SizedBox(height: 25),
//                   GridView.count(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     mainAxisSpacing: 5,
//                     crossAxisSpacing: 5,
//                     crossAxisCount: 1,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(80.0),
//                         child: Card(
//                           elevation: 5,
//                           shadowColor:
//                               Theme.of(context).scaffoldBackgroundColor ==
//                                       const Color(0xff1e1f20)
//                                   ? Colors.grey.shade400
//                                   : Colors.cyan,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           color: Theme.of(context).scaffoldBackgroundColor ==
//                                   const Color(0xff1E1F20)
//                               ? const Color.fromARGB(255, 43, 43, 41)
//                               : const Color.fromARGB(255, 244, 244, 244),
//                           child: InkWell(
//                             splashColor:
//                                 Theme.of(context).scaffoldBackgroundColor ==
//                                         const Color(0xff1e1f20)
//                                     ? Colors.grey.shade400
//                                     : Colors.cyan,
//                             borderRadius: BorderRadius.circular(15),
//                             onTap: () {
//                               Navigator.of(context).pushAndRemoveUntil(
//                                   MaterialPageRoute(
//                                       builder: (context) => LoadZanyari(
//                                             zanyari: const [],
//                                             eList: const [],
//                                           )),
//                                   (route) => true);
//                             },
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 SizedBox(
//                                   height: 90,
//                                   width: 90,
//                                   child: Theme.of(context)
//                                               .scaffoldBackgroundColor ==
//                                           const Color(0xff1E1F20)
//                                       ? Image.asset("icons/info-dark.png")
//                                       : Image.asset(
//                                           "icons/info.png",
//                                         ),
//                                 ),
//                                 Text(
//                                   'زانیاری گشتی',
//                                   style: TextStyle(
//                                       fontFamily: 'ir-sharp-m',
//                                       fontSize: 18,
//                                       color: Theme.of(context)
//                                                   .scaffoldBackgroundColor ==
//                                               const Color(0xff1E1F20)
//                                           ? const Color(0xfff7f7f7)
//                                           : const Color(0xff1E1F20)),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.all(8.0),
//                       //   child: Card(
//                       //     elevation: 5,
//                       //     shadowColor:
//                       //         Theme.of(context).scaffoldBackgroundColor ==
//                       //                 const Color(0xff1e1f20)
//                       //             ? Colors.grey.shade400
//                       //             : Colors.cyan,
//                       //     shape: RoundedRectangleBorder(
//                       //         borderRadius: BorderRadius.circular(15)),
//                       //     color: Theme.of(context).scaffoldBackgroundColor ==
//                       //             const Color(0xff1E1F20)
//                       //         ? const Color.fromARGB(255, 43, 43, 41)
//                       //         : const Color.fromARGB(255, 244, 244, 244),
//                       //     child: InkWell(
//                       //       splashColor:
//                       //           Theme.of(context).scaffoldBackgroundColor ==
//                       //                   const Color(0xff1e1f20)
//                       //               ? Colors.grey.shade400
//                       //               : Colors.cyan,
//                       //       borderRadius: BorderRadius.circular(15),
//                       //       onTap: () {
//                       //         selected = 'hzr';
//                       //         pagecontroller.animateToPage(1,
//                       //             duration: const Duration(milliseconds: 300),
//                       //             curve: Curves.elasticInOut);
//                       //       },
//                       //       child: Column(
//                       //         mainAxisAlignment:
//                       //             MainAxisAlignment.spaceEvenly,
//                       //         children: [
//                       //           Container(
//                       //             height: 90,
//                       //             width: 90,
//                       //             child: Theme.of(context)
//                       //                         .scaffoldBackgroundColor ==
//                       //                     const Color(0xff1E1F20)
//                       //                 ? Image.asset("icons/wise-dark.png")
//                       //                 : Image.asset(
//                       //                     "icons/wise.png",
//                       //                   ),
//                       //           ),
//                       //           Text(
//                       //             'هزری',
//                       //             style: TextStyle(
//                       //                 fontFamily: 'ir-sharp-m',
//                       //                 fontSize: 18,
//                       //                 color: Theme.of(context)
//                       //                             .scaffoldBackgroundColor ==
//                       //                         const Color(0xff1E1F20)
//                       //                     ? const Color(0xfff7f7f7)
//                       //                     : const Color(0xff1E1F20)),
//                       //           )
//                       //         ],
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class LoadZanyari extends StatefulWidget {
//   LoadZanyari({super.key, required this.zanyari, required this.eList});
//   List<ZanyariGshti> zanyari;
//   List<ZanyariGshti> eList;
//
//   @override
//   State<LoadZanyari> createState() => LoadZanyariState();
// }
//
// class LoadZanyariState extends State<LoadZanyari> {
//   Future refresh() async {
//     setState(() {
//       getZanyariGshti(http.Client());
//     });
//     return LoadZanyari(
//       eList: const [],
//       zanyari: const [],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const String title = "زانیاری گشتی";
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: 70,
//         scrolledUnderElevation: 20,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           title,
//           style: Theme.of(context).scaffoldBackgroundColor ==
//                   const Color(0xff1E1F20)
//               ? appbarTitleDataDark
//               : appbarTitleData,
//         ),
//       ),
//       body: FutureBuilder<List<ZanyariGshti>>(
//           future: getZanyariGshti(http.Client()),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasError) {
//               return RefreshIndicator(
//                 color: Theme.of(context).scaffoldBackgroundColor ==
//                         const Color(0xff1E1F20)
//                     ? Colors.cyan
//                     : Colors.cyan,
//                 onRefresh: () => refresh(),
//                 child: ListView(
//                   shrinkWrap: true,
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.bottomCenter,
//                       height: MediaQuery.of(context).size.height / 2.4,
//                       child: const Icon(
//                         Ionicons.cloud_offline_sharp,
//                         size: 60,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Container(
//                         alignment: Alignment.topCenter,
//                         height: MediaQuery.of(context).size.height / 2.3,
//                         child: const Text(
//                           "!کێشه‌ له‌ وه‌رگرتنی زانیاری هه‌یه‌",
//                           style: TextStyle(fontSize: 18, color: Colors.grey),
//                         )),
//                   ],
//                 ),
//               );
//             } else if (snapshot.hasData) {
//               return ZanyariGshtiTestPage(
//                 zanyari: [],
//                 eList: [],
//               );
//             } else {
//               return Center(
//                   child: SizedBox(
//                       height: 40,
//                       width: 40,
//                       child: Lottie.asset("assets/loading.json",
//                           frameRate: FrameRate.composition, animate: true)));
//             }
//           }),
//     );
//   }
// }
//
// class ZanyariGshtiTestPage extends StatefulWidget {
//   ZanyariGshtiTestPage({super.key, required this.zanyari, required this.eList});
//   final List<ZanyariGshti> zanyari;
//   List<ZanyariGshti> eList;
//
//   @override
//   State<ZanyariGshtiTestPage> createState() => _ZanyariGshtiTestPageState();
// }
//
// class _ZanyariGshtiTestPageState extends State<ZanyariGshtiTestPage> {
//   @override
//   void initState() {
//     widget.zanyari.shuffle();
//     super.initState();
//   }
//
//   get index => widget.eList;
//
//   late final PageController controller = PageController(initialPage: 0);
//   var ctime;
//   Future<bool> _onWillPop() {
//     DateTime now = DateTime.now();
//     if (ctime == null || now.difference(ctime) > const Duration(seconds: 2)) {
//       //add duration of press gap
//       ctime = now;
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const Text(
//               "بۆ دەرچوون دووجار لێبدە",
//               style: TextStyle(color: Color(0xfff7f7f7), fontSize: 17),
//               textAlign: TextAlign.center,
//               softWrap: true,
//             ),
//             Icon(
//               Ionicons.exit_outline,
//               color: Colors.red.shade700,
//               size: 30,
//             )
//           ],
//         ),
//         backgroundColor:
//             Theme.of(context).scaffoldBackgroundColor == const Color(0xff1E1F20)
//                 ? const Color.fromARGB(255, 43, 43, 41)
//                 : const Color(0xff1E1F20),
//         behavior: SnackBarBehavior.floating,
//         padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
//         margin: const EdgeInsets.fromLTRB(35, 0, 35, 50),
//         duration: const Duration(milliseconds: 1500),
//         clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       )); //scaffold message, you can show Toast message too.
//       return Future.value(false);
//     }
//     return Future.value(true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List length = [];
//     length.length = 5;
//     String toArabicNums(String arabicinput) {
//       const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
//       const arabic = [
//         '٠',
//         '١',
//         '٢',
//         '٣',
//         '٤',
//         '٥',
//         '٦',
//         '٧',
//         '٨',
//         '٩',
//       ];
//
//       for (int i = 0; i < english.length; i++) {
//         arabicinput = arabicinput.replaceAll(english[i], arabic[i]);
//       }
//
//       return arabicinput;
//     }
//
//     String currentPage = toArabicNums((length.length).toString());
//     List<Icon> iconsCorrectFalse = [];
//     int anjam = 0;
//     bool welamdrayawa = false;
//     setState(() {
//       widget.eList = widget.zanyari;
//     });
//
//     void prsyariDwatr() {
//       if (!welamdrayawa) {
//         return;
//       } else {
//         controller.nextPage(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInToLinear);
//         welamdrayawa = false;
//       }
//     }
//
//     return WillPopScope(
//         onWillPop: _onWillPop,
//         child: Scaffold(
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             toolbarHeight: 0,
//           ),
//           body: PageView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             padEnds: false,
//             controller: controller,
//             // physics: const NeverScrollableScrollPhysics(),
//             reverse: true,
//             itemCount: length.length,
//             itemBuilder: (BuildContext context, int index) {
//               return index < length.length
//                   ? Column(
//                       children: [
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           alignment: Alignment.center,
//                           height: 210,
//                           width: MediaQuery.of(context).size.width - 16,
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                               color: Theme.of(context)
//                                           .scaffoldBackgroundColor ==
//                                       const Color(0xff1E1F20)
//                                   ? const Color(0xff2a2929)
//                                   : const Color.fromARGB(255, 231, 231, 231),
//                               boxShadow: [
//                                 BoxShadow(
//                                     blurStyle: BlurStyle.normal,
//                                     blurRadius: 4,
//                                     color: Theme.of(context)
//                                                 .scaffoldBackgroundColor ==
//                                             const Color(0xff1E1F20)
//                                         ? Colors.grey.shade400.withOpacity(0.5)
//                                         : Colors.cyan.shade800.withOpacity(0.5),
//                                     offset: const Offset(0, 4)),
//                               ],
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 4, right: 4),
//                             child: Text(
//                               widget.zanyari[index].prsyar,
//                               style: const TextStyle(
//                                   fontFamily: 'ir-sharp-m', fontSize: 16),
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height / 70,
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height / 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             Text(
//                                 "${toArabicNums((index + 1).toString())}  |  $currentPage",
//                                 style: TextStyle(
//                                     fontSize: 22,
//                                     fontFamily: 'ir-sharp-m',
//                                     color: Theme.of(context)
//                                                 .scaffoldBackgroundColor ==
//                                             const Color(0xff1E1F20)
//                                         ? Colors.cyan
//                                         : const Color(0xff323131))),
//                             SizedBox(
//                                 width: MediaQuery.of(context).size.width / 2.7),
//                             nxtButtonV2(
//                                 text: Text(
//                                   index + 1 == length.length
//                                       ? "ئەنجامەکان"
//                                       : "دواتر",
//                                   style: TextStyle(
//                                       fontFamily: 'ir-sharp-m',
//                                       fontSize: 18,
//                                       color: Theme.of(context)
//                                                   .scaffoldBackgroundColor ==
//                                               const Color(0xff1E1F20)
//                                           ? const Color(0xfff7f7f7)
//                                           : const Color(0xff1E1F20)),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 func: prsyariDwatr),
//                             const SizedBox(
//                               width: 15,
//                             )
//                           ],
//                         )
//                       ],
//                     )
//                   : Column(
//                       children: [
//                         Container(
//                           alignment: Alignment.center,
//                           height: 150,
//                           child: Text(
//                             'ئه‌نجام',
//                             style: appbarTitleData,
//                           ),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.only(right: 20),
//                           height: MediaQuery.of(context).size.height / 2.7,
//                           child: ListView(
//                               physics: const ScrollPhysics(
//                                   parent: BouncingScrollPhysics()),
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     if (iconsCorrectFalse.isEmpty)
//                                       const SizedBox(),
//                                     if (iconsCorrectFalse.isNotEmpty)
//                                       iconsCorrectFalse[0],
//                                     Text(
//                                       'پرسیاری یەکەم :',
//                                       style: TextStyle(
//                                           fontFamily: 'ir-sharp-m',
//                                           fontSize: 16,
//                                           color: Theme.of(context)
//                                                       .scaffoldBackgroundColor ==
//                                                   const Color(0xff1E1F20)
//                                               ? const Color(0xfff7f7f7)
//                                               : const Color(0xff1E1F20)),
//                                       textDirection: TextDirection.rtl,
//                                     ),
//                                   ],
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 35),
//                                   child: Divider(
//                                     height: 30,
//                                     thickness: 1,
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     if (iconsCorrectFalse.isEmpty)
//                                       const SizedBox(),
//                                     if (iconsCorrectFalse.isNotEmpty)
//                                       iconsCorrectFalse[1],
//                                     Text(
//                                       'پرسیاری دووەم :',
//                                       style: TextStyle(
//                                           fontFamily: 'ir-sharp-m',
//                                           fontSize: 16,
//                                           color: Theme.of(context)
//                                                       .scaffoldBackgroundColor ==
//                                                   const Color(0xff1E1F20)
//                                               ? const Color(0xfff7f7f7)
//                                               : const Color(0xff1E1F20)),
//                                       textDirection: TextDirection.rtl,
//                                     ),
//                                   ],
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 35),
//                                   child: Divider(
//                                     height: 30,
//                                     thickness: 1,
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     if (iconsCorrectFalse.isEmpty)
//                                       const SizedBox(),
//                                     if (iconsCorrectFalse.isNotEmpty)
//                                       iconsCorrectFalse[2],
//                                     Text(
//                                       'پرسیاری سێیەم :',
//                                       style: TextStyle(
//                                           fontFamily: 'ir-sharp-m',
//                                           fontSize: 16,
//                                           color: Theme.of(context)
//                                                       .scaffoldBackgroundColor ==
//                                                   const Color(0xff1E1F20)
//                                               ? const Color(0xfff7f7f7)
//                                               : const Color(0xff1E1F20)),
//                                       textDirection: TextDirection.rtl,
//                                     ),
//                                   ],
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 35),
//                                   child: Divider(
//                                     height: 30,
//                                     thickness: 1,
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     if (iconsCorrectFalse.isEmpty)
//                                       const SizedBox(),
//                                     if (iconsCorrectFalse.isNotEmpty)
//                                       iconsCorrectFalse[3],
//                                     Text(
//                                       'پرسیاری چوارەم :',
//                                       style: TextStyle(
//                                           fontFamily: 'ir-sharp-m',
//                                           fontSize: 16,
//                                           color: Theme.of(context)
//                                                       .scaffoldBackgroundColor ==
//                                                   const Color(0xff1E1F20)
//                                               ? const Color(0xfff7f7f7)
//                                               : const Color(0xff1E1F20)),
//                                       textDirection: TextDirection.rtl,
//                                     ),
//                                   ],
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 35),
//                                   child: Divider(
//                                     height: 30,
//                                     thickness: 1,
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     if (iconsCorrectFalse.isEmpty)
//                                       const SizedBox(),
//                                     if (iconsCorrectFalse.isNotEmpty)
//                                       iconsCorrectFalse[4],
//                                     Text(
//                                       'پرسیاری پێنجه‌م :',
//                                       style: TextStyle(
//                                           fontFamily: 'ir-sharp-m',
//                                           fontSize: 16,
//                                           color: Theme.of(context)
//                                                       .scaffoldBackgroundColor ==
//                                                   const Color(0xff1E1F20)
//                                               ? const Color(0xfff7f7f7)
//                                               : const Color(0xff1E1F20)),
//                                       textDirection: TextDirection.rtl,
//                                     ),
//                                   ],
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 35),
//                                   child: Divider(
//                                     height: 30,
//                                     thickness: 1,
//                                   ),
//                                 ),
//                               ]),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 CircleAvatar(
//                                   radius: 60,
//                                   backgroundColor: Theme.of(context)
//                                               .scaffoldBackgroundColor ==
//                                           const Color(0xff1E1F20)
//                                       ? const Color.fromARGB(255, 43, 43, 41)
//                                       : const Color.fromARGB(
//                                           255, 231, 231, 231),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: <Widget>[
//                                       Text(
//                                         toArabicNums(anjam.toString()),
//                                         style: TextStyle(
//                                             fontFamily: 'ir-sharp-m',
//                                             fontSize: 22,
//                                             color: Theme.of(context)
//                                                         .scaffoldBackgroundColor ==
//                                                     const Color(0xff1E1F20)
//                                                 ? const Color(0xfff7f7f7)
//                                                 : const Color(0xff1E1F20)),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets.only(
//                                             left: 10, right: 10),
//                                         decoration: BoxDecoration(
//                                           border: Border(
//                                               left: BorderSide.none,
//                                               top: BorderSide.none,
//                                               right: BorderSide.none,
//                                               bottom: BorderSide(
//                                                 color: Theme.of(context)
//                                                             .scaffoldBackgroundColor ==
//                                                         const Color(0xff1E1F20)
//                                                     ? const Color.fromARGB(
//                                                         255, 231, 231, 231)
//                                                     : const Color.fromARGB(
//                                                         255, 43, 43, 41),
//                                               )),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         toArabicNums((index).toString()),
//                                         style: TextStyle(
//                                             fontFamily: 'ir-sharp-m',
//                                             fontSize: 22,
//                                             color: Theme.of(context)
//                                                         .scaffoldBackgroundColor ==
//                                                     const Color(0xff1E1F20)
//                                                 ? const Color(0xfff7f7f7)
//                                                 : const Color(0xff1E1F20)),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Text(
//                                   'نمره‌که‌ت',
//                                   style: appbarTitleData,
//                                 )
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             nxtButtonV2(
//                                 text: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Icon(CupertinoIcons.restart,
//                                         color: Theme.of(context)
//                                                     .scaffoldBackgroundColor ==
//                                                 const Color(0xff1E1F20)
//                                             ? const Color(0xfff7f7f7)
//                                             : const Color(0xff1E1F20)),
//                                     Text(
//                                       'دووبارە',
//                                       style: TextStyle(
//                                           fontFamily: 'ir-sharp-m',
//                                           fontSize: 18,
//                                           color: Theme.of(context)
//                                                       .scaffoldBackgroundColor ==
//                                                   const Color(0xff1E1F20)
//                                               ? const Color(0xfff7f7f7)
//                                               : const Color(0xff1E1F20)),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ],
//                                 ),
//                                 func: () => Navigator.of(context)
//                                     .pushAndRemoveUntil(
//                                         MaterialPageRoute(
//                                             builder: (context) => LoadZanyari(
//                                                 zanyari: const [],
//                                                 eList: const [])),
//                                         (route) => false))
//                           ],
//                         ),
//                       ],
//                     );
//             },
//           ),
//         ));
//   }
// }
