// Экран "Профиль"
import 'package:flutter/material.dart';
import 'package:forecast_x/features/webview/webview_screen.dart';

class RatesScreen extends StatelessWidget {
  const RatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebViewScreen(
      initialUrl: 'https://www.nationalgeographic.com',
    );
  }
}
