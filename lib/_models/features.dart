import 'package:flutter/material.dart';

class Feature {
  const Feature({required this.t});
  final String t;
}

class FeatureData {
  const FeatureData({this.title = '', this.message = ''});
  final String title;
  final String message;
}

class IntroFeature {
  const IntroFeature({required this.title, required this.description, required this.url, required this.icon});
  final String title;
  final String description;
  final String url;
  final IconData icon;
}
