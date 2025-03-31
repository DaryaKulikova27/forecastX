// ignore_for_file: non_constant_identifier_names, unused_element, library_private_types_in_public_api

part of '../app_page_indicator.dart';

//////
//////
//////
//////
//////
//////

final class _AppPageIndicatorThemeText {}

final _text = _AppPageIndicatorThemeText();

//////
//////
//////
//////
//////
//////
///
final class _AppPageIndicatorThemeColors {
  Color get active_dot => AppColors.green;
  Color get inactive_dot => AppColors.green08;
}

final _colors = _AppPageIndicatorThemeColors();

///
//////
//////
//////
//////
//////
//////
class _AppPageIndicatorTheme {
  _AppPageIndicatorThemeColors get color => _colors;
  _AppPageIndicatorThemeText get text => _text;
}

extension AppPageIndicatorStandartTheme on StandartTheme {
  _AppPageIndicatorTheme get AppPageIndicator => _AppPageIndicatorTheme();
}

var _feature = StandartTheme().AppPageIndicator; //вырезаем