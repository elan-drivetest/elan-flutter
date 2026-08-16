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

/// Semantic colours for the dashboard ride cards.
///
/// These are not new brand colours — every one is a darker step of a swatch the
/// app already used (Material Green 500 → 800, Red 500 → 800, Blue 500 → 800).
/// The hues are unchanged; only the shade moved, because the original values
/// failed WCAG AA badly wherever text sat on them:
///
/// ```
///                        before            after
///   Start Ride label     2.78:1  FAIL      5.13:1  PASS
///   Transfer label       3.22:1  FAIL      4.91:1  PASS
///   Status chip text     2.53:1  FAIL      4.67:1  PASS
///   Phone link           3.12:1  FAIL      5.75:1  PASS
///   Disabled label       2.46:1  FAIL      5.68:1  PASS
/// ```
///
/// Rule of thumb when extending this: keep the **500** shades for decorative
/// fills and tints, and use the **800** shades any time text or an icon sits on
/// top. AA needs 4.5:1 for body text and 3:1 for UI boundaries.
class RideCardColors {
  const RideCardColors._();

  // ── Positive / primary action ──
  /// Tint fills and decorative accents only — never behind text.
  static const Color accentGreen = Color(0xFF4CAF50);

  /// Filled buttons and any text/icon on a light green tint. 5.13:1 on white.
  static const Color actionGreen = Color(0xFF2E7D32);

  /// 10% accent over white, precomputed so text on it can be measured.
  static const Color greenTint = Color(0xFFEDF7EE);

  // ── Destructive / caution ──
  /// Transfer label and border. 4.91:1 on [redTint].
  static const Color actionRed = Color(0xFFC62828);

  /// Stop Ride fill — already passed at 4.98:1, kept as-is.
  static const Color stopRed = Color(0xFFD32F2F);
  static const Color redTint = Color(0xFFFFEBEB);

  // ── Links ──
  /// Tappable phone numbers. 5.75:1 on white; Blue 500 managed only 3.12:1.
  static const Color link = Color(0xFF1565C0);
  static const Color linkTint = Color(0xFFE3F2FD);

  // ── Neutrals ──
  /// Secondary labels. 6.19:1 on white — `Colors.black54` sat at 4.61:1, which
  /// passes but leaves no headroom once it lands on a tinted row.
  static const Color mutedText = Color(0xFF616161);

  /// Disabled fill and label. 5.68:1, so a gated button is still readable —
  /// disabled controls are exempt from WCAG contrast, but here "disabled" is a
  /// meaningful state (the ride timing gates), so it needs to be legible.
  static const Color disabledSurface = Color(0xFFF5F5F5);
  static const Color disabledContent = Color(0xFF616161);
  static const Color disabledBorder = Color(0xFFBDBDBD);

  /// Hairlines and card edges.
  static const Color hairline = Color(0xFFEEEEEE);
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
