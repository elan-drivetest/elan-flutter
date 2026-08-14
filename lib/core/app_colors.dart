import 'dart:ui';



import 'package:flutter/material.dart';

/// Light Mode Colors
enum LightModeColor {
  primary(Color(0xFFFFFFFF)),
  noticeBackground(Color(0xFFFFF9C4)),
  textPrimary(Color(0xFF000000)),
  statColor(Color(0xFFFF4081)),
  infoText(Color(0xFF2196F3)),
  rideCard(Color(0xFFE0E0E0)),
  buttonBackground(Color(0xFF2196F3)),
  navActive(Color(0xFF0C8B44)),
  navBorder(Color(0xFFCAFFE2)),
  navInactive(Color(0xFF000000));

  const LightModeColor(this.color);
  final Color color;
}

/// Dark Mode Colors
enum DarkModeColor {
  primary(Color(0xFF121212)),
  noticeBackground(Color(0xFF3E2723)),
  textPrimary(Color(0xFFFFFFFF)),
  statColor(Color(0xFFFF80AB)),
  infoText(Color(0xFF90CAF9)),
  rideCard(Color(0xFF424242)),
  buttonBackground(Color(0xFF757575)),
  navActive(Color(0xFF0C8B44)),
  navBorder(Color(0xFFCAFFE2)),
  navInactive(Color(0xFFB0BEC5));

  const DarkModeColor(this.color);
  final Color color;
}




