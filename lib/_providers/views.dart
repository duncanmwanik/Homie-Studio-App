import 'package:flutter/material.dart';

import '../_services/hive/boxes.dart';
import '../_variables/features.dart';

class ViewsProvider with ChangeNotifier {
  // home view
  String view = globalBox.get('view', defaultValue: features.colors);
  bool isColors() => view == features.colors;
  bool isPatterns() => view == features.patterns;
  bool isMusic() => view == features.music;
  bool isMixer() => view == features.mixer;
  bool isFavorites() => view == features.favorites;

  void setView(String type) {
    view = type;
    globalBox.put('view', type);
    notifyListeners();
  }
}
