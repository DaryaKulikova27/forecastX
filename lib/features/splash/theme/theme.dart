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

final class SplashScreensThemeText {
  TextStyle get title_welcome =>
      AppTextStyles.title.copyWith(color: AppColors.white);
}

final _text = SplashScreensThemeText();

//////
//////
//////
//////
//////
//////
///
final class SplashScreensThemeColors {
  Color get rect_buttot_splash => AppColors.green;
  Color get icon_color => AppColors.green;
  Color get icon_background => AppColors.white02;
  Color get back_button_splash => AppColors.white04;
  Color get back_button_border_splash => AppColors.white04;
  Color get dot_border_color => AppColors.white08;
  Color get background_loader => AppColors.white04;
  Color get border_loader => AppColors.white04;
  Color get animated_border_loader => AppColors.green;
  Color get social_network_contain_background => AppColors.white04;
  Color get social_network_contain_lines => AppColors.white04;
}

final _colors = SplashScreensThemeColors();

///
//////
//////
//////
//////
//////
//////
class SplashScreensTheme {
  SplashScreensThemeColors get color => _colors;
  SplashScreensThemeText get text => _text;
}

extension SplashScreensStandartTheme on StandartTheme {
  //Прописать класс с темой вместо StandartTheme
  SplashScreensTheme get SplashScreens => SplashScreensTheme();
}

var _feature = StandartTheme().SplashScreens; //вырезаем