import 'package:flutter/material.dart';

class Feature {
  const Feature({required this.t});
  final String t;
}

class FeatureData {
  const FeatureData({this.title = '', this.message = '', this.icon = Icons.circle});
  final String title;
  final String message;
  final IconData icon;
}

class IntroFeature {
  const IntroFeature({required this.title, required this.description, required this.icon});
  final String title;
  final String description;
  final IconData icon;
}
