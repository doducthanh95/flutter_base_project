import 'package:flutter/material.dart';
import 'package:flutter_base_project/utils/config/app_config.dart';

enum AppTheme { dark, light }

abstract class OneColor {
  Color get primary100;
}

class LightColor implements OneColor {
  static final LightColor instance = LightColor._();
  @override
  Color get primary100 => const Color(0xFFF0EAFF);

  LightColor._();
}

class DartColor implements OneColor {
  DartColor._();
  static final DartColor instance = DartColor._();

  @override
  Color get primary100 => const Color(0xFFFFEA00);
}

class OneColorProvider {
  static OneColor get instance {
    switch (AppConfig.instance.appTheme) {
      case AppTheme.dark:
        return DartColor.instance;
      default:
        return LightColor.instance;
    }
  }
}
