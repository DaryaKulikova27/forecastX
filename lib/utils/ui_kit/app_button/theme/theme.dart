// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forecast_x/theme/scr/app_colors.dart';
import 'package:forecast_x/theme/scr/app_text_styles.dart';
import 'package:forecast_x/theme/theme.dart';

//////
//////
//////
//////
//////
//////

final class AppButtonThemeText {
  TextStyle get app_button_active_text =>
      AppTextStyles.semibold16.copyWith(color: AppColors.white);
  TextStyle get app_button_secondary_text =>
      AppTextStyles.semibold14.copyWith(color: AppColors.white);
  TextStyle get app_button_inactive_text => AppTextStyles.semibold14.copyWith(
        color: AppColors.black,
      );
  TextStyle get text_button_text => AppTextStyles.semibold14.copyWith(
        color: AppColors.green,
      );
}

final _text = AppButtonThemeText();

//////
//////
//////
//////
//////
//////
///
final class AppButtonThemeColors {
  Color get active_button_fill => AppColors.green;
  Color get text_button_text_color => AppColors.green;
  Color get active_button_background => const Color.fromRGBO(41, 172, 115, 1);
  Color get icon_active => AppColors.black;
  Color get icon_inactive => AppColors.white;
  Color get secondary_button_background => AppColors.white04;
  Color get secondary_button_stroke => AppColors.white04;
  Color get inactive_button_background => AppColors.grey;
  Color get inner_shadow => AppColors.white04;
  Color get shadow1 => AppColors.green.withOpacity(0.15);
  Color get shadow2 => AppColors.green.withOpacity(0.13);
  Color get shadow3 => AppColors.green08;
  Color get shadow4 => AppColors.green.withOpacity(0.02);
  Color get shadow5 => AppColors.green.withOpacity(0);
  Color get button_background => AppColors.dark;
}

final _colors = AppButtonThemeColors();

///
//////
//////
//////
//////
//////
//////
class AppButtonTheme {
  AppButtonThemeColors get color => _colors;
  AppButtonThemeText get text => _text;
}

extension AppButtonStandartTheme on StandartTheme {
  //Прописать класс с темой вместо StandartTheme
  AppButtonTheme get AppButton => AppButtonTheme();
}

var _feature = StandartTheme().AppButton; //вырезаем