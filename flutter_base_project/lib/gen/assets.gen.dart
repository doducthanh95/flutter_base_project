/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/loading.json
  String get loading => 'assets/animations/loading.json';

  /// List of all assets
  List<String> get values => [loading];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/academy.svg
  String get academy => 'assets/icons/academy.svg';

  /// File path: assets/icons/arrow_down.svg
  String get arrowDown => 'assets/icons/arrow_down.svg';

  /// File path: assets/icons/arrow_left.svg
  String get arrowLeft => 'assets/icons/arrow_left.svg';

  /// File path: assets/icons/arrow_right.svg
  String get arrowRight => 'assets/icons/arrow_right.svg';

  /// File path: assets/icons/arrow_right_blue.svg
  String get arrowRightBlue => 'assets/icons/arrow_right_blue.svg';

  /// List of all assets
  List<String> get values =>
      [academy, arrowDown, arrowLeft, arrowRight, arrowRightBlue];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_rocket.png
  AssetGenImage get icRocket =>
      const AssetGenImage('assets/images/ic_rocket.png');

  /// File path: assets/images/ic_watting_yellow.png
  AssetGenImage get icWattingYellow =>
      const AssetGenImage('assets/images/ic_watting_yellow.png');

  /// File path: assets/images/image_accident_intro_five.png
  AssetGenImage get imageAccidentIntroFive =>
      const AssetGenImage('assets/images/image_accident_intro_five.png');

  /// File path: assets/images/image_accident_intro_four.png
  AssetGenImage get imageAccidentIntroFour =>
      const AssetGenImage('assets/images/image_accident_intro_four.png');

  /// File path: assets/images/image_accident_intro_one.png
  AssetGenImage get imageAccidentIntroOne =>
      const AssetGenImage('assets/images/image_accident_intro_one.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        icRocket,
        icWattingYellow,
        imageAccidentIntroFive,
        imageAccidentIntroFour,
        imageAccidentIntroOne
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// File path: assets/translations/vi-VI.json
  String get viVI => 'assets/translations/vi-VI.json';

  /// List of all assets
  List<String> get values => [enUS, viVI];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
