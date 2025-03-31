// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:forecast_x/theme/scr/app_colors.dart';
import 'package:forecast_x/theme/scr/app_text_styles.dart';

//////
//////
//////
//////
//////
//////
///

class StandartTheme {}

final class CoreThemeText {
  TextStyle get app_bar_text_title =>
      AppTextStyles.H3.copyWith(color: AppColors.white);
}

final _text = CoreThemeText();

//////
//////
//////
//////
//////
//////
///
final class CoreThemeColors {
  Color get scaffoldBackground => AppColors.black;
  Color get app_bar_settings_icon => AppColors.green;
  Color get app_bar_arrow_back_icon => AppColors.white;
  Color get app_bar_leading_background => AppColors.white04;
  Color get app_bar_leading_stroke => AppColors.white08;
}

final _colors = CoreThemeColors();

///
//////
//////
//////
//////
//////
//////
class CoreTheme {
  CoreThemeColors get color => _colors;
  CoreThemeText get text => _text;
}

extension CoreStandartTheme on StandartTheme {
  //Прописать класс с темой вместо StandartTheme
  CoreTheme get Core => CoreTheme();
}

var _feature = StandartTheme().Core; //вырезаем