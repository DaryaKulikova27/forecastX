// ignore_for_file: non_constant_identifier_names, unused_element

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

final class OnboardingThemeText {
  TextStyle get title_onboarding =>
      AppTextStyles.H1.copyWith(color: AppColors.white);
  TextStyle get paragraph_onboarding =>
      AppTextStyles.regular18.copyWith(color: AppColors.grey);
  TextStyle get button_text_onboarding =>
      AppTextStyles.semibold14.copyWith(color: AppColors.black);
}

final _text = OnboardingThemeText();

//////
//////
//////
//////
//////
//////
///
final class OnboardingThemeColors {
  Color get button_onboarding => AppColors.green;
}

final _colors = OnboardingThemeColors();

///
//////
//////
//////
//////
//////
//////
class OnboardingTheme {
  OnboardingThemeColors get color => _colors;
  OnboardingThemeText get text => _text;
}

extension OnboardingStandartTheme on StandartTheme {
  //Прописать класс с темой вместо StandartTheme
  OnboardingTheme get Onboarding => OnboardingTheme();
}

var _feature = StandartTheme().Onboarding;
