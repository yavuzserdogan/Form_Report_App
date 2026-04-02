import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const double small = 12.0;
  static const double medium = 16.0;
  static const double large = 24.0;

  static BorderRadius get smallRadius => BorderRadius.circular(small);

  static BorderRadius get mediumRadius => BorderRadius.circular(medium);

  static BorderRadius get largeRadius => BorderRadius.circular(large);
}
