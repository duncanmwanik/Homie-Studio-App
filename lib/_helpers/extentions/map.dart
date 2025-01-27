import 'dart:convert';

extension MapExtentions on Map {
  Map newMap() => jsonDecode(jsonEncode(this));
}
