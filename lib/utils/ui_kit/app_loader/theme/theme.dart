// ignore_for_file: non_constant_identifier_names, unused_element, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:forecast_x/theme/scr/app_colors.dart';
import 'package:forecast_x/theme/scr/app_text_styles.dart';
import 'package:forecast_x/theme/theme.dart';

//////
//////
//////
//////
//////
//////

final class _AppLoaderThemeText {
  TextStyle get text_style => AppTextStyles.medium14.copyWith(
        color: AppColors.white,
      );
}

final _text = _AppLoaderThemeText();

//////
//////
//////
//////
//////
//////
///
final class _AppLoaderThemeColors {
  Color get activeColor => AppColors.primacy;
  Color get inactiveColor => AppColors.white08;
}

final _colors = _AppLoaderThemeColors();

///
//////
//////
//////
//////
//////
//////
class _AppLoaderTheme {
  _AppLoaderThemeColors get color => _colors;
  _AppLoaderThemeText get text => _text;
}

extension AppLoaderStandartTheme on StandartTheme {
  _AppLoaderTheme get AppLoader => _AppLoaderTheme();
}
