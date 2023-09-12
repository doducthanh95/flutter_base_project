import 'package:alice/alice.dart';
import 'package:flutter_base_project/utils/common/theme_provider.dart';

class AppConfig {
  static final instance = AppConfig._();

  factory AppConfig() {
    return instance;
  }

  AppConfig._();

  final String domain = 'https://api.jikan.moe';

  final alice = Alice(showNotification: false, showShareButton: true);

  AppTheme appTheme = AppTheme.light;
}
