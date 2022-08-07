import 'dart:convert';
import 'dart:developer';

import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> xmlToJson(String _url) async {
  var uri = Uri.parse(_url);
  final _transformer = Xml2Json();
  var _response = await http.get(uri);
  _transformer.parse(_response.body);
  var json = _transformer.toGData();
  var result = jsonDecode(json)["rss"];
  //log(result);
  return result;
}
