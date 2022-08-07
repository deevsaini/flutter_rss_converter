import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class RssViewer extends StatefulWidget {
  final String url;
  RssViewer({Key? key, required this.url}) : super(key: key);

  @override
  State<RssViewer> createState() => _RssViewerState();
}

class _RssViewerState extends State<RssViewer> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(),
    );
  }
}
