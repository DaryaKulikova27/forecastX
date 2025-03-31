import 'package:flutter/material.dart';
import 'package:forecast_x/theme/scr/app_colors.dart';
import 'package:forecast_x/theme/theme.dart';
part 'theme/theme.dart';

class AppPageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;

  const AppPageIndicator({
    super.key,
    required this.currentIndex,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final indicatorWidth = (totalWidth - 32) / pageCount;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(pageCount, (index) {
              return Container(
                width: indicatorWidth,
                height: 2,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? AppColors.primacy
                      : Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
