import 'package:flutter/material.dart';

/// R-PASS design tokens: soft, light, teal/emerald palette.
class AppColors {
  AppColors._();

  static const bg = Color(0xFFF2F8F7);
  static const surface = Color(0xFFFFFFFF);
  static const ink = Color(0xFF0F2A2E);
  static const muted = Color(0xFF5B7377);
  static const hint = Color(0xFF94A8AB);
  static const border = Color(0xFFD5E4E2);

  static const primary = Color(0xFF0E9F8E);
  static const primaryDark = Color(0xFF0A7C70);
  static const primarySoft = Color(0xFFE0F4F1);

  static const success = Color(0xFF12A150);
  static const warning = Color(0xFFF5A524);
  static const error = Color(0xFFE5484D);

  static const cardShadow = BoxShadow(
    color: Color(0x140F2A2E),
    blurRadius: 18,
    offset: Offset(0, 6),
  );
}
