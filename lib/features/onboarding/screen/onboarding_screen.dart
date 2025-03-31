import 'package:flutter/material.dart';
import 'package:forecast_x/db/db.dart';
import 'package:forecast_x/features/onboarding/components/free_translations.dart';
import 'package:forecast_x/features/router/router.dart';
import 'package:forecast_x/utils/ui_kit/app_button/oval_button.dart';
import 'package:forecast_x/utils/ui_kit/app_page_indicator/app_page_indicator.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;
  int pageIndex = 0;
  String btnText = "Далее";

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/png/onboarding_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 74,
                  right: 17,
                  left: 17,
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: AppPageIndicator(
                    key: ValueKey<int>(pageIndex),
                    currentIndex: pageIndex,
                    pageCount: 3,
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                      btnText = (index == 2) ? 'Начать' : 'Далее';
                    });
                  },
                  children: const [
                    FreeTranslationsWidget(
                      titles: 'Прогнозируй и выигрывай',
                      paragraphes:
                          'Получай точные прогнозы на спортивные события и делай уверенные ставки.',
                      iconPath: 'assets/images/svg/onboarding_first_icon.svg',
                    ),
                    FreeTranslationsWidget(
                      titles: 'Ставки в один клик',
                      paragraphes:
                          'Удобный интерфейс и быстрые ставки на любимые команды в реальном времени.',
                      iconPath: 'assets/images/svg/onboarding_second_icon.svg',
                    ),
                    FreeTranslationsWidget(
                      titles: 'Поддержка 24/7',
                      paragraphes:
                          'Мы всегда рядом! Задавай вопросы в чате и получай оперативную помощь.',
                      iconPath: 'assets/images/svg/onboarding_third_icon.svg',
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 64,
                  right: 17,
                  left: 17,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OvalButtonWithArrow(
                      text: btnText,
                      onPressed: () async {
                        if (pageIndex < 2) {
                          await controller.animateToPage(
                            pageIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOutCubic,
                          );
                        } else {
                          await DB.instance.setIsFirstLaunch(false);
                          context.pushReplacement(routes.forecasts);
                        }
                        setState(
                          () {
                            btnText = (pageIndex == 2) ? 'Начать' : 'Далее';
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
