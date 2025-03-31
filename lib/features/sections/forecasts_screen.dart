import 'package:flutter/material.dart';
import 'package:forecast_x/features/webview/webview_screen.dart';

class ForecastsScreen extends StatelessWidget {
  const ForecastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebViewScreen(
      initialUrl: 'https://1winbet.in',
    );
  }
}
