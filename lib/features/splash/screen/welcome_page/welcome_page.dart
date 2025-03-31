import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forecast_x/features/splash/theme/theme.dart';
import 'package:forecast_x/theme/theme.dart';
import 'package:forecast_x/utils/ui_kit/app_loader/app_loader.dart';
import 'package:gap/gap.dart';

var _feature = StandartTheme().SplashScreens; //вырезаем

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/png/welcome_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/svg/welcome_logo.svg',
                        height: 80,
                        width: 66,
                        fit: BoxFit.fitWidth,
                      ),
                      const Gap(16),
                      Text(
                        'forecastX',
                        style: _feature.text.title_welcome,
                      ),
                    ],
                  ),
                  const Gap(73),
                  const AppLoader(
                    size: 72,
                    strokeWidth: 6,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
