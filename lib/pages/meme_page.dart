import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rssbhargav/pages/web_view.dart';
import 'package:rssbhargav/pages/xml_to_json.dart';
import 'package:rssbhargav/utils/constants.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;

class MemePage extends StatefulWidget {
  MemePage({Key? key}) : super(key: key);

  @override
  State<MemePage> createState() => _MemePageState();
}

class _MemePageState extends State<MemePage> {
  Map<String, dynamic> data = Map<String, dynamic>();
  String? imageLink;
  getData() {
    xmlToJson(Constants.meme_1).then((value) {
      data.addAll(value);
      setState(() {});
      log(value.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getImageLink(String _html) {
    var document = parse(_html);
    dom.Element? link = document.querySelector('img');
    imageLink = link != null ? link.attributes['src'] : '';
    print(imageLink);
    return imageLink;
  }

  getVideoThumbnail(String _html) {
    var document = parse(_html);
    dom.Element? link = document.querySelector('video');
    String? thumbnail = link != null ? link.attributes['poster'] : '';
    print(thumbnail);
    return thumbnail;
  }

  @override
  Widget build(BuildContext context) {
    //   getData();

    return data.isEmpty
        ? Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: data["channel"]["item"].length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => RssViewer(
                                  url: data["channel"]["item"][index]["link"]
                                          ["\$t"]
                                      .toString())));
                    },
                    child: Card(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            dense: true,
                            //isThreeLine: true,
                            minLeadingWidth: 40,
                            trailing: const Icon(Icons.arrow_forward_ios),
                            leading: Container(
                                width: 70,
                                height: 120,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: CachedNetworkImage(
                                      imageUrl: data["channel"]["item"][index]
                                                      ["category"]["\$t"]
                                                  .toString() !=
                                              "video"
                                          ? getImageLink(data["channel"]["item"]
                                                      [index]["description"]
                                                  ["__cdata"]
                                              .toString())
                                          : getVideoThumbnail(data["channel"]
                                                      ["item"][index]
                                                  ["description"]["__cdata"]
                                              .toString())),
                                )),
                            title: Text(
                              data["channel"]["item"][index]["title"]["__cdata"]
                                  .toString(),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                                data["channel"]["pubDate"]["\$t"].toString()),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          );
  }
}
