import 'dart:convert' as jsonconvert;

import 'package:music_app/models/gif.dart';

class Conversion {
  Conversion._() {}
  static dynamic convertJSONTOObject(String responseBody, String key) {
    var map = jsonconvert.jsonDecode(responseBody);
    return map[key];
  }

  static List<Gif> convertSongObjects(List list) {
    return list.map((obj) => Gif.mapToObject(obj)).toList();
  }
}
