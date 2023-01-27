import 'package:flutter/material.dart';

class MainColors {
  MainColors({
    required this.light,
    required this.light_09,
    required this.dark,
  });
  final Color light;
  final Color light_09;
  final Color dark;
}

class NeutralColors {
  NeutralColors({
    required this.dark,
    required this.dark_light,
    required this.light_dark,
    required this.light,
    required this.purple,
    required this.primary_05,
  });

  final Color dark;
  final Color dark_light;
  final Color light_dark;
  final Color light;
  final Color purple;
  final Color primary_05;
}

class ColorContants {
  ColorContants._();

  static const primary = Color(0xFF643FDB);
  static const secondary = Color(0xFFFF8A00);
  static const bg = Color(0xFFF4F1F5);
  static final MainColors main = MainColors(
    light: const Color(0xFFFFFFFF),
    light_09: const Color(0xFFFFFFFF).withOpacity(0.9),
    dark: const Color(0xFF000000),
  );
  static final NeutralColors neutral = NeutralColors(
    dark: const Color(0xFF1C1243),
    dark_light: const Color(0xFFA29EB6),
    light_dark: const Color(0xFFEFF1F3),
    light: const Color(0xFFFFFFFF),
    purple: const Color(0xFFD8CFF6),
    primary_05: const Color(0xFFB29FED),
  );
}
