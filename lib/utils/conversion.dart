import 'dart:convert' as jsonconvert;

import 'package:music_app/models/song.dart';

class Conversion {
  Conversion._() {}
  static dynamic convertJSONTOObject(String responseBody, String key) {
    var map = jsonconvert.jsonDecode(responseBody);
    return map[key];
  }

  static List<Song> convertSongObjects(List list) {
    return list.map((obj) => Song.mapToObject(obj)).toList();
  }
}
