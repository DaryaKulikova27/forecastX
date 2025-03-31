import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forecast_x/theme/theme.dart';
import 'package:forecast_x/utils/ui_kit/app_button/theme/theme.dart';

var _feature = StandartTheme().AppButton;

class OvalButtonWithArrow extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const OvalButtonWithArrow({
    super.key,
    required this.onPressed,
    this.text = "Далее",
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: _feature.color.button_background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              text,
              style: _feature.text.app_button_active_text,
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            'assets/images/svg/button_arrow.svg',
            height: 24,
            width: 24,
            fit: BoxFit.fitWidth,
          )
        ],
      ),
    );
  }
}
