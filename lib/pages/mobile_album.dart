import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

import '../components/appbar_sys_uioverlay.dart';
import '../models/wenakan_model.dart';

class Album extends StatefulWidget {
  const Album({super.key});

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  Future refreshAlbumData() async {
    setState(() {
      getWenakan(http.Client());
    });
    return const Album();
  }

  @override
  Widget build(BuildContext context) {
    const String title = "ئه‌لبومه‌که‌مان";
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
      body: FutureBuilder<List<Wenakan>>(
        future: getWenakan(http.Client()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return RefreshIndicator(
              color: Colors.cyan,
              onRefresh: () => refreshAlbumData(),
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
            return AlbumData(wena: snapshot.data!);
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

class AlbumData extends StatefulWidget {
  const AlbumData({super.key, required this.wena});
  final List<Wenakan> wena;

  @override
  State<AlbumData> createState() => _AlbumDataState();
}

class _AlbumDataState extends State<AlbumData> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        shrinkWrap: true,
        itemCount: widget.wena.length,
        separatorBuilder: ((context, index) => Divider(
              height: 5,
              color: Theme.of(context).scaffoldBackgroundColor ==
                      const Color(0xff1E1F20)
                  ? Colors.grey.shade800
                  : Colors.cyan.shade600.withOpacity(0.5),
              thickness: 1,
            )),
        itemBuilder: ((context, index) => Container(
              constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
              ),
              child: Column(
                children: [
                  ExpansionTile(
                      initiallyExpanded: true,
                      iconColor: Theme.of(context).scaffoldBackgroundColor ==
                              const Color(0xff1A1F20)
                          ? Colors.cyan.shade800
                          : Colors.cyan.shade500,
                      collapsedIconColor:
                          Theme.of(context).scaffoldBackgroundColor ==
                                  const Color(0xff1A1F20)
                              ? Colors.cyan.shade800
                              : Colors.cyan.shade500,
                      collapsedTextColor:
                          Theme.of(context).scaffoldBackgroundColor ==
                                  const Color(0xff1A1F20)
                              ? const Color(0xff1E1F20)
                              : Colors.grey,
                      textColor: Theme.of(context).scaffoldBackgroundColor ==
                              const Color(0xff1A1F20)
                          ? const Color(0xff1E1F20)
                          : Colors.grey,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.wena[index].date,
                            style: const TextStyle(
                                fontSize: 13, fontFamily: 'ir-sharp-m'),
                          ),
                          Text(
                            widget.wena[index].title,
                            style: TextStyle(
                              fontFamily: 'ir-sharp-m',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).scaffoldBackgroundColor ==
                                          const Color(0xff1E1F20)
                                      ? Colors.cyan.shade500
                                      : Colors.cyan.shade800,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8, bottom: 2),
                          child: Text(
                            widget.wena[index].description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                                fontSize: 13, fontFamily: 'ir-sharp-m'),
                          ),
                        ),
                        const SizedBox(height: 5)
                      ]),
                  const SizedBox(height: 4),
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      widget.wena[index].link,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            )));
  }
}
