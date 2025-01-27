import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../_models/features.dart';

Features features = Features();

class Features {
  String colors = 'colors';
  String segments = 'segments';
  String patterns = 'patterns';
  String music = 'music';
  String mixer = 'mixer';
  String favorites = 'favorites';
}

Map<String, FeatureData> featureData = {
  features.colors: const FeatureData(title: 'Colors', icon: FontAwesomeIcons.palette),
  features.colors: const FeatureData(title: 'Segments', icon: FontAwesomeIcons.baby),
  features.patterns: const FeatureData(title: 'Patterns', icon: FontAwesomeIcons.fireFlameSimple),
  features.music: const FeatureData(title: 'Music', icon: FontAwesomeIcons.music),
  features.mixer: const FeatureData(title: 'Mixer', icon: FontAwesomeIcons.mixer),
  features.favorites: const FeatureData(title: 'Favorites', icon: FontAwesomeIcons.solidHeart),
};

extension FeatureExtentions on String {
  String title() => featureData[this]!.title;
  String message() => featureData[this]!.message;
  IconData icon() => featureData[this]!.icon;

  bool isColors() => this == features.colors;
  bool isPatterns() => this == features.patterns;
  bool isMusic() => this == features.music;
  bool isMixer() => this == features.mixer;
  bool isFavorites() => this == features.favorites;
}
