// Главный экран с навигацией
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forecast_x/theme/scr/app_colors.dart';
import 'package:go_router/go_router.dart';

class CoreScaffold extends StatefulWidget {
  final StatefulNavigationShell? navigationShell;
  final Widget body;
  final bool showBottomNavBar;

  const CoreScaffold({
    super.key,
    required this.body,
    this.navigationShell,
    this.showBottomNavBar = true,
  });

  @override
  State<CoreScaffold> createState() => _CoreScaffoldState();
}

class _CoreScaffoldState extends State<CoreScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.body,
          if (widget.showBottomNavBar && widget.navigationShell != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.dark,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BottomNavigationBar(
                    currentIndex: widget.navigationShell!.currentIndex,
                    onTap: (index) => widget.navigationShell!.goBranch(index),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    selectedItemColor: AppColors.primacy,
                    unselectedItemColor: AppColors.white,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    type: BottomNavigationBarType.fixed,
                    items: [
                      _buildNavItem(
                        iconPath: 'assets/images/svg/nav_bar_forecasts.svg',
                        label: 'Прогнозы',
                        isActive: widget.navigationShell!.currentIndex == 0,
                      ),
                      _buildNavItem(
                        iconPath: 'assets/images/svg/nav_bar_rates.svg',
                        label: 'Ставки',
                        isActive: widget.navigationShell!.currentIndex == 1,
                      ),
                      _buildNavItem(
                        iconPath: 'assets/images/svg/nav_bar_chat.svg',
                        label: 'Чат',
                        isActive: widget.navigationShell!.currentIndex == 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        height: 24,
        width: 24,
        fit: BoxFit.fitWidth,
        colorFilter: ColorFilter.mode(
          isActive ? AppColors.primacy : AppColors.white,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        iconPath,
        height: 24,
        width: 24,
        fit: BoxFit.fitWidth,
        colorFilter: const ColorFilter.mode(
          AppColors.primacy,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
