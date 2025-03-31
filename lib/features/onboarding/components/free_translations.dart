import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forecast_x/features/onboarding/theme/theme.dart';
import 'package:forecast_x/theme/theme.dart';
import 'package:gap/gap.dart';

var _feature = StandartTheme().Onboarding;

class FreeTranslationsWidget extends StatelessWidget {
  final String titles, paragraphes;
  final String iconPath;

  const FreeTranslationsWidget(
      {super.key,
      required this.titles,
      required this.paragraphes,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 164,
              width: 164,
              fit: BoxFit.fitWidth,
            ),
            const Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                titles,
                style: _feature.text.title_onboarding,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                paragraphes,
                style: _feature.text.paragraph_onboarding,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
