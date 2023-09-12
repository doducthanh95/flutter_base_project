import 'package:flutter/material.dart';
import 'package:flutter_base_project/utils/constants/one_font.dart';

class OneStyle {
  static const TextStyle heading1 = TextStyle(
    fontFamily: OneFont.fontFamily,
    fontWeight: OneFont.bold,
    fontSize: OneFont.size36,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: OneFont.fontFamily,
    fontWeight: OneFont.semiBold,
    fontSize: OneFont.size28,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: OneFont.fontFamily,
    fontWeight: OneFont.bold,
    fontSize: OneFont.size24,
  );
}
