import 'package:flutter/material.dart';

IconData sessionIconForKey(String key) {
  switch (key) {
    case 'coffee':
      return Icons.coffee;
    case 'brush':
      return Icons.brush_outlined;
    case 'design':
      return Icons.design_services;
    case 'sunny':
      return Icons.sunny;
    case 'restaurant':
      return Icons.restaurant_menu;
    case 'mic':
      return Icons.mic;
    case 'waves':
      return Icons.waves_outlined;
    case 'movie':
      return Icons.movie_filter;
    case 'pool':
      return Icons.pool;
    case 'piano':
      return Icons.piano;
    case 'chart':
      return Icons.ssid_chart;
    case 'museum':
      return Icons.museum;
    default:
      return Icons.bolt;
  }
}
