import 'package:flutter/material.dart';

/// ------------------------------
///  Debtrak Color System
/// ------------------------------
class DebtrakPalette {
  static const blue = ColorGroup(
    light: Color(0xFFD9E9FF),
    mid: Color(0xFF79AFFF),
    strong: Color(0xFF3D86FF),
    deep: Color(0xFF1F67FF),
    dark: Color(0xFF0D3DBF),
  );

  static const sapphire = ColorGroup(
    light: Color(0xFFE0EDFF),
    mid: Color(0xFF8AB7FF),
    strong: Color(0xFF3D82FF),
    deep: Color(0xFF1E5EFF),
    dark: Color(0xFF1230A8),
  );

  static const purple = ColorGroup(
    light: Color(0xFFF1E6FF),
    mid: Color(0xFFC5A1FF),
    strong: Color(0xFF9C6BFF),
    deep: Color(0xFF6B36FF),
    dark: Color(0xFF3D1E8F),
  );

  static const cyberPurple = ColorGroup(
    light: Color(0xFFEDE9FF),
    mid: Color(0xFFB9AEFF),
    strong: Color(0xFF7D74FF),
    deep: Color(0xFF4D3BFF),
    dark: Color(0xFF281DA0),
  );

  static const mint = ColorGroup(
    light: Color(0xFFE8FFF3),
    mid: Color(0xFFB2FFD8),
    strong: Color(0xFF5BFFB1),
    deep: Color(0xFF1DDB7F),
    dark: Color(0xFF0A8C4C),
  );

  static const emerald = ColorGroup(
    light: Color(0xFFE5FFF3),
    mid: Color(0xFFA4F5CA),
    strong: Color(0xFF45D397),
    deep: Color(0xFF19AD70),
    dark: Color(0xFF0F6B44),
  );

  static const sunrise = ColorGroup(
    light: Color(0xFFFFF2E5),
    mid: Color(0xFFFFD6A6),
    strong: Color(0xFFFF9E46),
    deep: Color(0xFFFF6B1B),
    dark: Color(0xFFC54200),
  );

  static const golden = ColorGroup(
    light: Color(0xFFFFF6E1),
    mid: Color(0xFFFFE3AC),
    strong: Color(0xFFFFBD45),
    deep: Color(0xFFFF9B14),
    dark: Color(0xFFB96600),
  );

  static const softRed = ColorGroup(
    light: Color(0xFFFFE8E8),
    mid: Color(0xFFFFB1B1),
    strong: Color(0xFFFF6A6A),
    deep: Color(0xFFE63232),
    dark: Color(0xFF8F1616),
  );

  static const ruby = ColorGroup(
    light: Color(0xFFFFE6EB),
    mid: Color(0xFFFFB0C1),
    strong: Color(0xFFFF4D78),
    deep: Color(0xFFD81E4F),
    dark: Color(0xFF8A0E2F),
  );

  static const aqua = ColorGroup(
    light: Color(0xFFE8FFFB),
    mid: Color(0xFFB5FAEE),
    strong: Color(0xFF4FEBD8),
    deep: Color(0xFF13C5B0),
    dark: Color(0xFF0E7C73),
  );

  static const deepTeal = ColorGroup(
    light: Color(0xFFE6FBFF),
    mid: Color(0xFFA8F0FF),
    strong: Color(0xFF42D8FF),
    deep: Color(0xFF0DB7E0),
    dark: Color(0xFF086C8A),
  );
}

/// --------------------------------------
/// Named Color Group Model
/// --------------------------------------
class ColorGroup {
  final Color light;
  final Color mid;
  final Color strong;
  final Color deep;
  final Color dark;

  const ColorGroup({
    required this.light,
    required this.mid,
    required this.strong,
    required this.deep,
    required this.dark,
  });
}
